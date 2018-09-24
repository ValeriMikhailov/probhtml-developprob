function tableCreate() {
    let body = document.getElementsByTagName('body')[0];
    let tbl = document.createElement('table');
    tbl.style.width = '100%';
    tbl.setAttribute('border', '1');
    let tbdy = document.createElement('tbody');
    for (let i = 0; i < 3; i++) {
        let tr = document.createElement('tr');
        for (let j = 0; j < 2; j++) {
            if (i == 2 && j == 1) {
                break
            } else {
                var td = document.createElement('td');
                td.appendChild(document.createTextNode('\u0020'))
                i == 1 && j == 1 ? td.setAttribute('rowSpan', '2') : null;
                tr.appendChild(td)
            }
        }
        tbdy.appendChild(tr);
    }
    tbl.appendChild(tbdy);
    body.appendChild(tbl)
}

tableCreate();