const handler = new Key("q", ["control", "shift"], () => {
	Window.focused().setTopLeft({ x: 0, y: 0 });
});
