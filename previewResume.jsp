<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.*, com.itextpdf.text.pdf.draw.LineSeparator" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String linkedin = request.getParameter("linkedin");
    String objective = request.getParameter("objective");

    String sscInstitute = request.getParameter("sscInstitute");
    String sscDegree = request.getParameter("sscDegree");
    String sscYear = request.getParameter("sscYear");
    String sscScore = request.getParameter("sscScore");

    String hscInstitute = request.getParameter("hscInstitute");
    String hscDegree = request.getParameter("hscDegree");
    String hscYear = request.getParameter("hscYear");
    String hscScore = request.getParameter("hscScore");

    String gradInstitute = request.getParameter("gradInstitute");
    String gradDegree = request.getParameter("gradDegree");
    String gradYear = request.getParameter("gradYear");
    String gradScore = request.getParameter("gradScore");

    String pgInstitute = request.getParameter("pgInstitute");
    String pgDegree = request.getParameter("pgDegree");
    String pgYear = request.getParameter("pgYear");
    String pgScore = request.getParameter("pgScore");

    String skills = request.getParameter("skills");
    String activities = request.getParameter("activities");
    String projects = request.getParameter("projects");
    String declaration = request.getParameter("declaration");

    if ("download".equals(request.getParameter("action"))) {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=resume.pdf");

        Document document = new Document();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();

        Font headerFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
        Font sectionFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
        Font normalFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL);
        Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
        Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD); // Bigger font size
        Paragraph title = new Paragraph("Resume", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);  // Center alignment
        title.setSpacingAfter(15f);               // Add space below the title
        document.add(title);

       
        
        
        document.add(new Paragraph("Introduction", headerFont));
        document.add(Chunk.NEWLINE); // Add space
        document.add(new LineSeparator());

        document.add(new Paragraph("Name: " + name, normalFont));
        document.add(new Paragraph("Email: " + email, normalFont));
        document.add(new Paragraph("Phone: " + phone, normalFont));
        document.add(new Paragraph("Address: " + address, normalFont));
        document.add(new Paragraph("LinkedIn: " + linkedin, normalFont));
        document.add(new Paragraph("Career Objective:", normalFont));
        document.add(new Paragraph(objective.replaceAll("\\<.*?\\>", ""), normalFont));
        document.add(Chunk.NEWLINE); // Add space
        document.add(new LineSeparator());

        document.add(new Paragraph("Education", sectionFont));
        document.add(Chunk.NEWLINE); // Add space
        
     // Define fonts
       
        Font rowFont = new Font(Font.FontFamily.TIMES_ROMAN, 12);

        // Create table with 5 columns
        PdfPTable eduTable = new PdfPTable(5);
        eduTable.setWidthPercentage(100);  // Full width

        // Optional: set custom column widths (adjust as needed)
        eduTable.setWidths(new float[] { 2f, 4f, 3f, 2f, 2f });

        // Add header cells
        String[] headers = { "Level", "Institute", "Degree", "Year", "Score" };
        for (String col : headers) {
            PdfPCell headerCell = new PdfPCell(new Phrase(col, headerFont));
            headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            headerCell.setBackgroundColor(BaseColor.LIGHT_GRAY); // Optional: light gray background
            eduTable.addCell(headerCell);
        }

        // Add education data rows (example only, replace with dynamic values)
        eduTable.addCell(new Phrase("SSC", rowFont));
        eduTable.addCell(new Phrase("Shardabai Pawar Vidyalai.", rowFont));
        eduTable.addCell(new Phrase("SSC", rowFont));
        eduTable.addCell(new Phrase("2019", rowFont));
        eduTable.addCell(new Phrase("61.80 %", rowFont));

        eduTable.addCell(new Phrase("HSC", rowFont));
        eduTable.addCell(new Phrase("Shardabai Pawar Vidyalai.", rowFont));
        eduTable.addCell(new Phrase("HSC", rowFont));
        eduTable.addCell(new Phrase("2021", rowFont));
        eduTable.addCell(new Phrase("67.88 %", rowFont));

        eduTable.addCell(new Phrase("Graduation", rowFont));
        eduTable.addCell(new Phrase("SVPM’s CCSCE Malegaon bk.", rowFont));
        eduTable.addCell(new Phrase("BBA(CA)", rowFont));
        eduTable.addCell(new Phrase("2024", rowFont));
        eduTable.addCell(new Phrase("8.50 CGPA", rowFont));

        eduTable.addCell(new Phrase("Post Graduation", rowFont));
        eduTable.addCell(new Phrase("VIIT", rowFont));
        eduTable.addCell(new Phrase("MCA", rowFont));
        eduTable.addCell(new Phrase("2026", rowFont));
        eduTable.addCell(new Phrase("7.64 CGPA", rowFont));

        // Add spacing before and after the table
        eduTable.setSpacingBefore(10f);
        eduTable.setSpacingAfter(10f);

        // Add table to document
        document.add(eduTable);
        document.add(new LineSeparator());
        document.add(Chunk.NEWLINE); // Add space
        document.add(new Paragraph("Skills", sectionFont));
        
        com.itextpdf.text.List skillList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
        for (String item : skills.split("\n")) {
            skillList.add(new ListItem(item.trim(), normalFont));
        }
        document.add(skillList);
        document.add(Chunk.NEWLINE); // Add space
        document.add(new LineSeparator());

        document.add(new Paragraph("Co-Curricular Activities", sectionFont));
        com.itextpdf.text.List activityList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
        for (String item : activities.split("\n")) {
            activityList.add(new ListItem(item.trim(), normalFont));
        }
        document.add(activityList);
        document.add(Chunk.NEWLINE); // Add space
        document.add(new LineSeparator());

        document.add(new Paragraph("Projects", sectionFont));
        com.itextpdf.text.List projectList = new com.itextpdf.text.List(com.itextpdf.text.List.UNORDERED);
        for (String item : projects.split("\n")) {
            projectList.add(new ListItem(item.trim(), normalFont));
        }
        document.add(projectList);
        document.add(Chunk.NEWLINE); // Add space
        document.add(new LineSeparator());

        document.add(new Paragraph("Declaration", sectionFont));
        document.add(Chunk.NEWLINE); // Add space
        document.add(new Paragraph(declaration.replaceAll("\\<.*?\\>", ""), normalFont));

        document.close();

        OutputStream os = response.getOutputStream();
        baos.writeTo(os);
        os.flush();
        os.close();
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Resume Preview</title>
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            margin: 20px;
        }
        h2 {
            border-bottom: 1px solid black;
            padding-bottom: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }
        td {
            padding: 4px 8px;
            vertical-align: top;
        }
        .label {
            font-weight: bold;
            width: 150px;
        }
        ul {
            margin: 0;
            padding-left: 20px;
        }
        hr {
            margin: 15px 0;
        }
        .button-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div style="text-align: center;">
<h1>Resume Preview</h1>
</div>
<h2><b>Introduction :</b></h2>
<p><strong><b>Name:</b></strong> <%= name %></p>
<p><strong><b>Email:</b></strong> <%= email %></p>
<p><strong><b>Phone:</b></strong> <%= phone %></p>
<p><strong><b>Address:</b></strong> <%= address %></p>
<p><strong><b>LinkedIn:</b></strong> <%= linkedin %></p>

<hr>

<h2><b>Career Objective :</b></h2>
<p><%= objective %></p>

<hr>

<h2>Education :</h2><br>
<table border="1">
    <tr style="font-weight:bold;">
        <td><b>Level</b></td><td><b>Institute</b></td><td><b>Degree</b></td><td><b>Year</b></td><td><b>Score</b></td>
    </tr>
    <tr>
        <td>SSC</td><td><%= sscInstitute %></td><td><%= sscDegree %></td><td><%= sscYear %></td><td><%= sscScore %></td>
    </tr>
    <tr>
        <td>HSC</td><td><%= hscInstitute %></td><td><%= hscDegree %></td><td><%= hscYear %></td><td><%= hscScore %></td>
    </tr>
    <tr>
        <td>Graduation</td><td><%= gradInstitute %></td><td><%= gradDegree %></td><td><%= gradYear %></td><td><%= gradScore %></td>
    </tr>
    <tr>
        <td>Post Graduation</td><td><%= pgInstitute %></td><td><%= pgDegree %></td><td><%= pgYear %></td><td><%= pgScore %></td>
    </tr>
</table>

<hr>

<h2>Skills :</h2>

<%
    if (skills != null && !skills.trim().isEmpty()) {
%>
    <ul>
    <%
        for (String skill : skills.split("\n")) {
    %>
        <li><%= skill %></li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>No skills mentioned.</p>
<%
    }
%>


<hr>

<h2>Co-Curricular Activities :</h2>
<%
    if (activities != null && !activities.trim().isEmpty()) {
%>
    <ul>
    <%
        for (String act : activities.split("\n")) {
    %>
        <li><%= act %></li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>No co-curricular activities mentioned.</p>
<%
    }
%>


<hr>

<h2>Projects :</h2>
<%
    if (projects != null && !projects.trim().isEmpty()) {
%>
    <ul>
    <%
        for (String proj : projects.split("\n")) {
    %>
        <li><%= proj %></li>
    <%
        }
    %>
    </ul>
<%
    } else {
%>
    <p>No projects mentioned.</p>
<%
    }
%>


<hr>

<h2>Declaration :</h2>
<p><%= declaration %></p>

<div class="button-container">
    <form action="previewResume.jsp" method="post">
        <input type="hidden" name="action" value="download" />
        <%
            String[] fields = {
                "name", "email", "phone", "address", "linkedin", "objective",
                "sscInstitute", "sscDegree", "sscYear", "sscScore",
                "hscInstitute", "hscDegree", "hscYear", "hscScore",
                "gradInstitute", "gradDegree", "gradYear", "gradScore",
                "pgInstitute", "pgDegree", "pgYear", "pgScore",
                "skills", "activities", "projects", "declaration"
            };
            for (String field : fields) {
        %>
            <input type="hidden" name="<%= field %>" value="<%= request.getParameter(field) %>" />
        <%
            }
        %>
        <div style="text-align: center;">
        <button type="submit">Download PDF</button></div>
    </form>
</div>

</body>
</html>
