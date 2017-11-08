const Sequelize = require('sequelize');

//database setup
const connection = new Sequelize('nodejs', 'root', '',{
    host:'localhost',
    dialect:'mysql', pool:{max:10, min:0, idle:10000}});

//Test connection
connection.authenticate().then(() => {
    console.log('Connection has been established successfully.');
})
.catch(err => {console.error('Unable to connect to the database:',err);
});

// model definistions
const Semester = connection.define('semester',{
    id:{
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{
        type: Sequelize.DataTypes.ENUM,
        values:['Fall', 'Winter', 'Summer 1', 'Summer 2']
    },
    start: {
        type:Sequelize.DataTypes.STRING,
        allowNull:false

    },
    end: {
        type:Sequelize.DataTypes.STRING,
        allowNull:false
    }

});

const Course = connection.define('course',{
    id:{
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name:{type:Sequelize.DataTypes.STRING},
    code:{type:Sequelize.DataTypes.STRING}
})

var SemesterCourse = connection.define('semestercourse',{


});
const  Leturer = connection.define('lecturer',{
    id:{
        type: Sequelize.DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    firstName:{
        type:Sequelize.DataTypes.STRING
    },
    lastName:{
        type:Sequelize.DataTypes.STRING
    }
})
Semester.belongsToMany(Course,{through: 'semestercourse'});
Course.belongsToMany(Semester,{through: 'semestercourse'});




module.exports={
    connecion:connection,
    Semester:Semester,
    Course:Course,
    SemesterCourse:SemesterCourse,
    Leturer:Leturer

};
