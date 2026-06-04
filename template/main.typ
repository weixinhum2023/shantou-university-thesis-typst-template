#{
  import "@preview/stu-bachelor-thesis:0.1.0": template-main
  /************正文************/
  let text-content = {
    include "chapter_1.typ"
    include "chapter_2.typ"
    include "chapter_3.typ"
    include "chapter_4.typ"
  }
  show: template-main.with(
    /************封面&致谢************/
    (
      title: "汕头大学学位论文格式模板",
      title-en: "Shantou University Dissertation Format Template",
      gradeandmajor: "电子信息工程　2021级",
      student-id: "2021123456",
      author: "张三",
      college: "工学院",
      department: "电子工程系",
      supervisor: "李四教授",
      submit-date: datetime(year: 2026, month: 5, day: 2),

      /*摘要相关*/
      abstract: [
        //中文摘要
        学位论文是学生从事科研工作、工程实践的成果的主要表现，集中表明了作者在工作、实践中获得的新的发明、理论或见解，是学生申请学生、硕士或博士学位的重要依据，也是科研领域中的重要文献资料和社会的宝贵财富。

        为了提高学生学位论文的质量，做到学位论文在内容和格式上的规范化与统一化，特制作本模板。
      ],
      keywords: ("学位论文", "论文格式", "规范化", "模板"), //中文关键词
      abstract-en: [
        //英文摘要
        A dissertation is a primary manifestation of students' achievements
        in scientific research work and engineering practice.
        It systematically demonstrates the author's new inventions, theories or insights
        obtained through research and practice.
        It serves as an important basis for students to apply
        for bachelor's, master's or doctoral degrees,
        and is also an important literature resource
        in the scientific research field and a valuable asset to society.

        In order to improve the quality of students' dissertations
        and achieve standardization and unification of dissertations
        in both content and format, this template has been specially created.
      ],
      keywords-en: (
        //英文关键词
        "dissertation",
        "dissertation format",
        "standardization",
        "template",
      ),
      acknowledgements: {
        include "acknowledgements.typ" //致谢，请在"acknowledgements.typ"文件里面写致谢
      },
      bib: bibliography(
        style: "gb-7714-2005-numeric",
        title: none,
        "ref.bib",
      ),
      /***可选项(Optional)***/
      //封面内容宽度。若出现封面内容超出横线，则可以尝试通过取消下面的注释尝试解决。
      //cover-width: 80%

      //是否添加封底空白页，默认true，可以通过取消下面的注释来去掉封底空白页。
      //add-back-cover: false,
    ),
  )
  text-content
}
