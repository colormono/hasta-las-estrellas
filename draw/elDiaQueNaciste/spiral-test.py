from blackstripes import spiral

spiral.draw("tini.png",   # input
            "tini_spiral.svg",           # output
            2.0,                       # nibsize (line size in output svg)
            "#aa0000",                  # line color
            0.32,                       # scaling factor
            180, 108, 180, 108,         # levels
            2,                          # linespacing
            540, 1021, 0.7                # signature transform
            )
