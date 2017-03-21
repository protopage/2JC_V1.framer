#Document Setup
document.body.style.cursor = "auto"
Framer.Extras.Hints.disable()
Framer.Extras.ShareInfo.disable()
Framer.Extras.Preloader.enable()
# Sketch
sketch = Framer.Importer.load("imported/2JC@1x")
{Artboard_Copy_5, card, enterpriseSelected, teamsHover, teamsSelected, enterpriseHover, teamsZone, enterpriseZone, tooltipLimits, tooltipReport, tooltipAB, tooltipDynamic, tooltipRealTime, tooltipCode, tooltipPixel, tooltipFonts, hoverLimits, hoverReport, hoverAB, hoverDynamic, hoverRealTime, hoverCode, hoverPixel, hoverFonts} = sketch
#Scroll
scroll = ScrollComponent.wrap(Artboard_Copy_5)
scroll.scrollVertical = true
scroll.scrollHorizontal = false
scroll.mouseWheelEnabled = true
scroll.width = document.documentElement.clientWidth
scroll.height = document.documentElement.clientHeight
scroll.content.draggable = false

# Make a scroll bar
# ------------------------------------------------------------
	
scrollBar = new Layer
	x: Align.right
	width: 24
	height: Screen.height * (Screen.height / scroll.content.height)
	backgroundColor: ""

scrollBarShape = new Layer
	parent: scrollBar
	x: 8
	y: 8
	width: scrollBar.width - 16
	height: scrollBar.height - 16
	backgroundColor: "#8A8A8A"
	borderRadius: 100


# Move scroll bar on scroll
# ------------------------------------------------------------

scroll.onMove ->
	progress = scroll.scrollY / (scroll.content.height - scroll.height)
	scrollBar.y = progress * (Screen.height - scrollBar.height)


# Make scroll bar draggable
# ------------------------------------------------------------

scrollBar.draggable.enabled = true
scrollBar.draggable.horizontal = false
scrollBar.draggable.constraints =
	height: Screen.height

scrollBar.onDrag ->
	progress = scrollBar.y / (Screen.height - scrollBar.height)
	scroll.scrollY = progress * (scroll.content.height - scroll.height)


Canvas.onResize ->
	scroll.size = Canvas.size
	scrollBar.x = Align.right
#Tabs
enterpriseSelected.visible = false
enterpriseHover.visible = false

enterpriseZone.onMouseOver ->
	enterpriseHover.visible = true
	document.body.style.cursor = "pointer"

enterpriseZone.onMouseOut ->
	enterpriseHover.visible = false
	document.body.style.cursor = "auto"

enterpriseZone.onClick ->
	enterpriseSelected.visible = true
	teamsSelected.visible = false

teamsHover.visible = false

teamsZone.onMouseOver ->
	teamsHover.visible = true
	document.body.style.cursor = "pointer"

teamsZone.onMouseOut ->
	teamsHover.visible = false
	document.body.style.cursor = "auto"

teamsZone.onClick ->
	teamsSelected.visible = true
	enterpriseSelected.visible = false
#Tooltips
hovers = [hoverLimits, hoverReport, hoverAB, hoverDynamic, hoverRealTime, hoverCode, hoverPixel, hoverFonts]

tooltipsArray = [tooltipLimits, tooltipReport, tooltipAB, tooltipDynamic, tooltipRealTime, tooltipCode, tooltipPixel, tooltipFonts]


createHovers = (index) ->
	hovers[index].onMouseOver ->
		tooltipsArray[index].visible = true
	hovers[index].onMouseOut ->
		tooltipsArray[index].visible = false

for i in [0...hovers.length]
	createHovers(i)

