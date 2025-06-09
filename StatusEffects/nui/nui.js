window.addEventListener('message', (event) =>{
    const data = event.data
    if (data.type === "hunger"){
        document.getElementById("hungerbar").value = data.value
    }
    else if (data.type === "thirst"){
        document.getElementById("Thirstrbar").value = data.value
    }
})