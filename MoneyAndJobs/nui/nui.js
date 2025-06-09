window.addEventListener('message', (event) => {
    data = event.data;
    if (data.Type === "money"){
        document.getElementById("money").textContent = data.Value;
    }
});