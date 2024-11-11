return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 8,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "testTileset",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "testTileset.png",
      imagewidth = 64,
      imageheight = 64,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 16,
      tiles = {
        {
          id = 0,
          properties = {
            ["collidable"] = true,
            ["type"] = "wall"
          }
        },
        {
          id = 1,
          properties = {
            ["collidable"] = true,
            ["type"] = "wall"
          }
        },
        {
          id = 2,
          properties = {
            ["type"] = "ghost"
          }
        },
        {
          id = 3,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 4,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 5,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 6,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 7,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 8,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 9,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 10,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 11,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 12,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 13,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 14,
          properties = {
            ["type"] = ""
          }
        },
        {
          id = 15,
          properties = {
            ["type"] = ""
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 10,
      height = 8,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 2, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 3, 0, 1,
        1, 0, 3, 0, 0, 0, 0, 2, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    }
  }
}
