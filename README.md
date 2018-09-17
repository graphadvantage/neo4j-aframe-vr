# neo4j-aframe-vr

just foolin' around with vr...works best in firefox

dependencies:

oculus installed, touch controllers + oculus rift

to run:

`npm install`

`npm start`

navigate to localhost:3000/index.html to see the Neo4j Movie Graph in vr

to play:

left controller joystick to fly on gaze path

right controller laser to inspect nodes

note: to see mouseover texts in desktop mode (no rift vr)
change aframe-foregraph-component.js at line 272 to:

```
centerRaycaster.setFromCamera(
  new THREE.Vector2(0, 0), // Canvas center
  this.state.cameraObj
);

//centerRaycaster.set(from, to);

```

Also--

there's a very large analytics graph you can get to by navigating to localhost:3000/index-ikea.html

shows 'galaxies' products related by co-buying probability scores of > 0.70

TODO:
-wire up the oculus controllers to add browse graph functionality, eg nodes expansion events
-genericize api for inspecting any graph in vr
