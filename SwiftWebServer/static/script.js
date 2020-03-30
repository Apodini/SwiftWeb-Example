
console.log("connecting...");
let socket = new WebSocket(`ws://${window.location.host}/websocket`);

socket.onopen = (event) => {
    console.log("connected to application");
};

socket.onmessage = (event) => {
    document.body.innerHTML = event.data;
    console.log("body updated")
};

document.onclick = (event) => {
    let viewID = findClickResponderViewId(event.target)
    
    if (event.target.tagName === "INPUT") {
        return
    }
    
    if (viewID !== null) {
        console.log(`click on ${viewID}`);
        
        socket.send(JSON.stringify({
            click: {
                id: viewID,
            }
        }));
    }
};

document.onchange = (event) => {
    console.log(`change event`);
    
    if (event.srcElement.hasAttribute("change-event-responder")) {
        let viewID = event.srcElement.getAttribute("id");

        socket.send(JSON.stringify({
            change: {
                id: viewID,
                newValue: event.srcElement.value,
            }
        }));
    }
};

// bubbles the event up the tree to return the id of the first element with attribute
// "clickresponder"
function findClickResponderViewId(target) {
    let currentElement = target;

    while (true) {
        if (currentElement.hasAttribute("click-event-responder")) {
            return currentElement.getAttribute("id");
        }

        if (currentElement.parentElement !== null) {
            currentElement = currentElement.parentElement;
        } else {
            return null;
        }
    }
}
