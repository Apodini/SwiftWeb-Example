
console.log("connecting...");
let socket = new WebSocket(`ws://${window.location.host}/websocket`);

socket.onopen = (event) => {
    console.log("connected to application");
};

socket.onmessage = (event) => {
    console.log(event);
};

document.onclick = (event) => {
    let tapID = findTapId(event.target)
    console.log(`tap on ${tapID}`);
    socket.send(tapID)
};

function findTapId(target) {
    let currentElement = target;

    while (true) {
        if (currentElement.getAttribute("tap-id") !== null) {
            return currentElement.getAttribute("tap-id");
        }

        if (currentElement.parentElement !== null) {
            currentElement = currentElement.parentElement;
        } else {
            return null;
        }
    }
}
