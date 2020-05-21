window.addEventListener ("DOMContentLoaded", function () {
    document.querySelector ("#searchButton").addEventListener ("click", function () {
        location.href = "/search/"+document.querySelector("#searchBox").value
    })
})
