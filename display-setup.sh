#!/bin/bash

# Script quản lý màn hình kép tự động
# Tác giả: [Tên của bạn]
# Phiên bản: 2.0

# Cấu hình màn hình
INTERNAL="eDP-1"
EXTERNAL="HDMI-1-0"

# Màu sắc cho thông báo
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Hàm hiển thị thông báo
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Hàm hiển thị trợ giúp
show_help() {
    echo "Sử dụng: $0 [tùy chọn]"
    echo "Tùy chọn:"
    echo "  -h, --help          Hiển thị trợ giúp"
    echo "  -l, --list          Liệt kê tất cả màn hình"
    echo "  -s, --status        Hiển thị trạng thái màn hình"
    echo "  -e, --external      Chỉ sử dụng màn hình ngoài"
    echo "  -i, --internal      Chỉ sử dụng màn hình laptop"
    echo "  -d, --duplicate     Sao chép màn hình"
    echo "  -r, --reset         Đặt lại cấu hình mặc định"
    echo "  --left              Đặt màn hình ngoài bên trái"
    echo "  --right             Đặt màn hình ngoài bên phải (mặc định)"
    echo "  --above             Đặt màn hình ngoài phía trên"
    echo "  --below             Đặt màn hình ngoài phía dưới"
}

# Hàm kiểm tra xrandr
check_xrandr() {
    if ! command -v xrandr &> /dev/null; then
        log_error "xrandr không được cài đặt!"
        exit 1
    fi
}

# Hàm tự động phát hiện màn hình
detect_displays() {
    log_info "Đang phát hiện màn hình..."

    # Tìm màn hình laptop (thường là eDP hoặc LVDS)
    INTERNAL=$(xrandr | grep -E "^(eDP|LVDS)" | grep " connected" | cut -d' ' -f1 | head -n1)

    # Tìm màn hình ngoài - loại trừ eDP và LVDS
    EXTERNAL=$(xrandr | grep " connected" | grep -v -E "^(eDP|LVDS)" | cut -d' ' -f1 | head -n1)

    # Nếu không tìm thấy màn hình laptop, sử dụng màn hình chính
    if [[ -z "$INTERNAL" ]]; then
        log_warning "Không tìm thấy màn hình laptop, sử dụng màn hình chính"
        INTERNAL=$(xrandr | grep " connected primary" | cut -d' ' -f1 | head -n1)
        if [[ -z "$INTERNAL" ]]; then
            INTERNAL=$(xrandr | grep " connected" | cut -d' ' -f1 | head -n1)
        fi
    fi

    # Đảm bảo EXTERNAL khác INTERNAL
    if [[ "$EXTERNAL" == "$INTERNAL" ]]; then
        EXTERNAL=$(xrandr | grep " connected" | grep -v "^$INTERNAL" | cut -d' ' -f1 | head -n1)
    fi

    log_info "Màn hình laptop: ${INTERNAL:-'Không tìm thấy'}"
    log_info "Màn hình ngoài: ${EXTERNAL:-'Không tìm thấy'}"
}

# Hàm liệt kê màn hình
list_displays() {
    log_info "Danh sách tất cả màn hình:"
    xrandr | grep -E "^[A-Za-z0-9][A-Za-z0-9-]* (connected|disconnected)" | while read line; do
        display=$(echo "$line" | cut -d' ' -f1)
        status=$(echo "$line" | cut -d' ' -f2)
        if [[ "$status" == "connected" ]]; then
            echo -e "  ${GREEN}●${NC} $display (kết nối)"
        else
            echo -e "  ${RED}○${NC} $display (ngắt kết nối)"
        fi
    done
}

# Hàm hiển thị trạng thái
show_status() {
    log_info "Trạng thái màn hình hiện tại:"
    # Hiển thị tất cả màn hình connected và thông tin chi tiết
    xrandr | grep -E "^[A-Za-z0-9][A-Za-z0-9-]* connected" -A1 | grep -v "^--$"
}

# Hàm áp dụng cấu hình với xử lý lỗi
apply_config() {
    local cmd="$1"
    local description="$2"

    log_info "$description"

    if eval "$cmd" 2>/dev/null; then
        log_success "Cấu hình màn hình thành công!"

        # Lưu cấu hình vào file log
        echo "$(date): $description" >> ~/.display_config.log

        # Thông báo desktop (nếu có)
        if command -v notify-send &> /dev/null; then
            notify-send "Cấu hình màn hình" "$description" -t 3000
        fi
    else
        log_error "Không thể áp dụng cấu hình màn hình!"
        return 1
    fi
}

# Hàm cấu hình màn hình kép
setup_dual_display() {
    local position="${1:-right-of}"

    if [[ -z "$EXTERNAL" ]]; then
        log_error "Không tìm thấy màn hình ngoài!"
        return 1
    fi

    # Kiểm tra màn hình ngoài có kết nối không
    if ! xrandr | grep "^$EXTERNAL connected" &> /dev/null; then
        log_warning "Màn hình ngoài $EXTERNAL không được kết nối"
        return 1
    fi

    local cmd="xrandr --output \"$INTERNAL\" --auto --primary --output \"$EXTERNAL\" --auto --$position \"$INTERNAL\""
    apply_config "$cmd" "Thiết lập màn hình kép ($EXTERNAL $position $INTERNAL)"
}

# Hàm chỉ sử dụng màn hình ngoài
external_only() {
    if [[ -z "$EXTERNAL" ]] || ! xrandr | grep "^$EXTERNAL connected" &> /dev/null; then
        log_error "Màn hình ngoài không khả dụng!"
        return 1
    fi

    local cmd="xrandr --output \"$EXTERNAL\" --auto --primary --output \"$INTERNAL\" --off"
    apply_config "$cmd" "Chỉ sử dụng màn hình ngoài"
}

# Hàm chỉ sử dụng màn hình laptop
internal_only() {
    local cmd="xrandr --output \"$INTERNAL\" --auto --primary"
    if [[ -n "$EXTERNAL" ]]; then
        cmd="$cmd --output \"$EXTERNAL\" --off"
    fi
    apply_config "$cmd" "Chỉ sử dụng màn hình laptop"
}

# Hàm sao chép màn hình
duplicate_display() {
    if [[ -z "$EXTERNAL" ]] || ! xrandr | grep "^$EXTERNAL connected" &> /dev/null; then
        log_error "Màn hình ngoài không khả dụng!"
        return 1
    fi

    local cmd="xrandr --output \"$INTERNAL\" --auto --primary --output \"$EXTERNAL\" --auto --same-as \"$INTERNAL\""
    apply_config "$cmd" "Sao chép màn hình"
}

# Hàm đặt lại cấu hình
reset_config() {
    log_info "Đặt lại cấu hình màn hình..."
    xrandr --auto
    log_success "Đã đặt lại cấu hình mặc định"
}

# Hàm chính - logic tự động
auto_configure() {
    log_info "Đang tự động cấu hình màn hình..."

    if [[ -n "$EXTERNAL" ]] && xrandr | grep "^$EXTERNAL connected" &> /dev/null; then
        setup_dual_display "right-of"
    else
        internal_only
    fi
}

# Main script
main() {
    check_xrandr
    detect_displays

    case "${1:-auto}" in
        -h|--help)
            show_help
            ;;
        -l|--list)
            list_displays
            ;;
        -s|--status)
            show_status
            ;;
        -e|--external)
            external_only
            ;;
        -i|--internal)
            internal_only
            ;;
        -d|--duplicate)
            duplicate_display
            ;;
        -r|--reset)
            reset_config
            ;;
        --left)
            setup_dual_display "left-of"
            ;;
        --right)
            setup_dual_display "right-of"
            ;;
        --above)
            setup_dual_display "above"
            ;;
        --below)
            setup_dual_display "below"
            ;;
        auto|"")
            auto_configure
            ;;
        *)
            log_error "Tùy chọn không hợp lệ: $1"
            show_help
            exit 1
            ;;
    esac
}

# Chạy script với tất cả tham số
main "$@"
