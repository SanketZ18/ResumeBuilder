<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Builder</title>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            margin: 20px;
            border: 2px solid black;
            padding: 20px;
        }
        h2 {
            border-bottom: 1px solid black;
            padding-bottom: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 8px;
        }
        .section {
            margin-top: 30px;
        }
        .half {
            width: 48%;
            display: inline-block;
            vertical-align: top;
        }
        input[type="text"], textarea {
            width: 95%;
            padding: 6px;
            font-family: 'Times New Roman', serif;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            font-family: 'Times New Roman', serif;
        }
    </style>
</head>
<body>
    <form action="previewResume.jsp" method="post">
       <h2>Fill the following information for build a Resume.</h2><br>
       
        <h2>Introduction :</h2>
        <table>
            <tr>
                <td>Name:</td><td><input type="text" name="name" required /></td>
                <td>Email:</td><td><input type="text" name="email" required /></td>
            </tr>
            <tr>
                <td>Phone:</td><td><input type="text" name="phone" required /></td>
                <td>Address:</td><td><input type="text" name="address" required /></td>
            </tr>
            <tr>
                <td>LinkedIn:</td><td colspan="3"><input type="text" name="linkedin" /></td>
            </tr>
            <tr>
                <td>Career Objective:</td><td colspan="3"><textarea name="objective" rows="3"></textarea></td>
            </tr>
        </table>

        <div class="section">
            <h2>Education :</h2>
            <div class="half">
                <h3>10th :</h3>
                <p>Institute: <input type="text" name="sscInstitute" /></p>
                <p>Certificate: <input type="text" name="sscDegree" /></p>
                <p>Year: <input type="text" name="sscYear" /></p>
                <p>Percentage/CGPA: <input type="text" name="sscScore" /></p>
            </div>
            <div class="half">
                <h3>12th :</h3>
                <p>Institute: <input type="text" name="hscInstitute" /></p>
                <p>Certificate: <input type="text" name="hscDegree" /></p>
                <p>Year: <input type="text" name="hscYear" /></p>
                <p>Percentage/CGPA: <input type="text" name="hscScore" /></p>
            </div>
            <div class="half">
                <h3>Graduation :</h3>
                <p>Institute: <input type="text" name="gradInstitute" /></p>
                <p>Degree: <input type="text" name="gradDegree" /></p>
                <p>Year: <input type="text" name="gradYear" /></p>
                <p>Percentage/CGPA: <input type="text" name="gradScore" /></p>
            </div>
            <div class="half">
                <h3>Post Graduation (Optional) :</h3>
                <p>Institute: <input type="text" name="pgInstitute" /></p>
                <p>Degree: <input type="text" name="pgDegree" /></p>
                <p>Year: <input type="text" name="pgYear" /></p>
                <p>Percentage/CGPA: <input type="text" name="pgScore" /></p>
            </div>
        </div>

        <div class="section">
            <h2>Skills :</h2>
            <textarea name="skills" rows="4"></textarea>
        </div>

        <div class="section">
            <h2>Co-Curricular Activities :</h2>
            <textarea name="activities" rows="4"></textarea>
        </div>

        <div class="section">
            <h2>Project Details :</h2>
            <textarea name="projects" rows="4"></textarea>
        </div>

        <div class="section">
            <h2>Declaration :</h2>
            <textarea name="declaration" rows="3"></textarea>
        </div>
<h4>This website developed by Sanket Zagade .</h4><br>
        <div style="text-align:center;">
            <input class="btn" type="submit" value="Preview" />
        </div>
    
    </form>
</body>
</html>
