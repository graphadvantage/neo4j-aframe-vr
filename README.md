# neo4j-aframe-vr

just foolin' around with vr...works best in firefox

### dependencies:

oculus installed, touch controllers + oculus rift

### to run:

`npm install`

`npm start`

navigate to localhost:3000/index.html to see the Neo4j Movie Graph in vr

### to play:

left controller joystick to fly on gaze path

right controller laser to inspect nodes

note: to see mouseover texts in desktop mode (no rift vr)
change aframe-forcegraph-component.js at line 272 to:

```
centerRaycaster.setFromCamera(
  new THREE.Vector2(0, 0), // Canvas center
  this.state.cameraObj
);

//centerRaycaster.set(from, to);

```

### Also--

there's a very large analytics graph you can get to by navigating to localhost:3000/index-ikea.html

shows 'galaxies' products related by co-buying probability scores of > 0.70

TODO:

-wire up the oculus controllers to add browse graph functionality, eg node expansions

-wire up and genericize Neo4j api for inspecting any graph in vr


### Thanks to:

https://github.com/vasturiano/aframe-forcegraph-component

https://www.npmjs.com/package/aframe-look-at-component

https://aframe.io

https://github.com/donmccurdy/aframe-extras

https://github.com/donmccurdy/aframe-physics-system

http://vonwolfehaus.github.io/von-grid/editor/

https://github.com/openleap/aframe-leap-hands
