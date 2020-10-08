from blackstripes import sketchy

sketchy.draw("source.png",  # input
             "tini_sketchy.svg",  # output
             1,  # nibsize (line size in output svg)
             100,  # max line length
             "#000000",  # line color
             0.32,  # scaling factor
             1,  # line size (internal line size for calculations)
             1000, 1000, 0.7  # signature transform tx, ty, scale
             )
