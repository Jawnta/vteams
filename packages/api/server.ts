import app from "./index"

const PORT = process.env.PORT || 3000;
app.set('port', PORT);

app.listen(PORT, () => {
    console.log(
        `Express Server started on Port ${app.get(
            'port'
        )} | Environment : ${app.get('env')}
        `
    );
});
