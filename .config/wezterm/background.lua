local home = os.getenv("HOME")

return {
  {
    source = {
      File = home .. '/Pictures/anime-girl-white-hair.jpg',
    },
    hsb = {
      brightness = 0.015,
    },
  },
}
