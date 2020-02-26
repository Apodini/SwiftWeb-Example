
console.log("connecting...");
let socket = new WebSocket(`ws://${window.location.host}/websocket`);

socket.onopen = (event) => {
    console.log("connected to application");
};

socket.onmessage = (event) => {
    console.log(event);
};

document.onclick = (event) => {
    console.log(event.target);
    socket.send("click event")
};
