// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/products");
const userRouter = require("./routes/user");


// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB = "mongodb+srv://roshankrsingh9857:roshan9857@cluster0.p5neg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);


// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful", {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      tlsInsecure: true,
    });
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
