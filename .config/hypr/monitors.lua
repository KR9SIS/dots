------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Laptop
hl.monitor({
	output = "desc:BOE 0x0ADF",
	mode = "2560x1600@60.00",
	position = "5430x1440",
	scale = "1.60",
})

-- Ultrawide
hl.monitor({
	output = "desc:ASR PG34WQ15R2B 0x00002750",
	mode = "3440x1440@59.97",
	position = "3926x0",
	scale = "1.00",
})

-- General
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
