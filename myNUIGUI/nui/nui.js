window.addEventListener('message', (event) => {
    const data = event.data;

    if (data.type === "info"){
        document.getElementById("pos-x").textContent = Math.round(data.x*100)/100;
        document.getElementById("pos-y").textContent = Math.round(data.y*100)/100;
        document.getElementById("pos-z").textContent = Math.round(data.z*100)/100;
        document.getElementById("heading").textContent = Math.round(data.heading*100)/100;
    }
});