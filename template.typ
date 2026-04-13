#import "lib/config.typ": 字体, 字号
#import "lib/algo.typ": algo, comment, d, i

#let template-main(info, text-body) = {
  import "lib/cover.typ": *
  import "lib/declaration.typ": *
  import "lib/chinese_abstract.typ": *
  import "lib/english_abstract.typ": *
  import "lib/catalog.typ": *
  import "lib/main_text.typ": *
  // 设置页面的页边距为顶边距2.5cm，右边距2.0cm，底边距2.0cm，左边距2.5cm。
  set page(
    paper: "a4",
    margin: (top: 2.5cm, right: 2.0cm, bottom: 2.0cm, left: 2.5cm),
  )

  info = (
    (
      title: "汕头大学学位论文格式模板",
      title-en: "Shantou University Dissertation Format Template",
      gradeandmajor: "电子信息工程　20XX级",
      student-id: "2021123456",
      author: "张三",
      college: "工学院",
      department: "电子工程系",
      supervisor: "李四教授",
      submit-date: datetime
        .today()
        .display("[year]年[month padding:none]月[day padding:none]日"),
      abstract: [
        学位论文是学生从事科研工作、工程实践的成果的主要表现，集中表明了作者在工作、实践中获得的新的发明、理论或见解，是学生申请学生、硕士或博士学位的重要依据，也是科研领域中的重要文献资料和社会的宝贵财富。

        为了提高学生学位论文的质量，做到学位论文在内容和格式上的规范化与统一化，特制作本模板。
      ],
      keywords: ("学位论文", "论文格式", "规范化", "模板"),
      abstract-en: [
        A dissertation is a primary manifestation of students' achievements in scientific research work and engineering practice. It systematically demonstrates the author's new inventions, theories or insights obtained through research and practice. It serves as an important basis for students to apply for bachelor's, master's or doctoral degrees, and is also an important literature resource in the scientific research field and a valuable asset to society.

        In order to improve the quality of students' dissertations and achieve standardization and unification of dissertations in both content and format, this template has been specially created.
      ],
      keywords-en: (
        "dissertation",
        "dissertation format",
        "standardization",
        "template",
      ),
    )
      + info
  )

  /************本科生论文封面************/
  bachelor-cover(
    info: info,
  )

  info.title = if type(info.title) == str [#info.title] else if (
    type(info.title) == array
  ) [#if info.title.len() == 2 [#(
    info.title.at(0) + info.title.at(1)
  )] else if (
    info.title.len() == 1
  ) [#info.title.at(0)] else [#panic(
    "非法title输入，请检查title数组长度！",
  )]] else [#panic(
    "非法title输入，请检查title输入！",
  )]

  /************声明页************/
  bachelor-decl-page(
    info: info,
  )

  /************中文摘要页************/
  bachelor-abstract-ch(
    info: info,
  )[#info.abstract]

  /************英文摘要页************/
  bachelor-abstract-en(
    info: info,
  )[#info.abstract-en]

  /************目录页************/
  setup-outline()

  /************正文************/
  setup-bodytext[
    #text-body
  ]
}
