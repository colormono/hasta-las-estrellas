from blackstripes import spiral

spiral.draw("source.png",   # input
            "source_spiral.svg",           # output
            1.0,                       # nibsize (line size in output svg)
            "#CCCCCC",                  # line color
            0.32,                       # scaling factor
            180, 108, 180, 108,         # levels
            2,                          # linespacing
            540, 1021, 0.7                # signature transform
            )
