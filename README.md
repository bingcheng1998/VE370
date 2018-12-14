# VE370

<img src="https://ws1.sinaimg.cn/large/006tNbRwly1fwg7hovo4gj30ky0ektck.jpg" width="200" align=left />

## About Honor Code

If there is same questions or labs in the future, it is the responsibility of JI students not to copy or modify these codes, or TeX files because it is against the Honor Code. The owner of this repository dosen't take any commitment for other's faults.

According to the student handbook (2015 version),

> It is a violation of the Honor Code for students to submit, as their own, work that is not the result of their own labor and thoughts. This applies, in particular, to ideas, expressions or work obtained from other students as well as from books, the internet, and other sources. The failure to properly credit ideas, expressions or work from others is considered plagiarism.

------

## Slides

![image-20181214164837916](https://ws2.sinaimg.cn/large/006tNbRwly1fy6de85papj315y0iwjva.jpg)

---

## Books

![image-20181214164930340](https://ws4.sinaimg.cn/large/006tNbRwly1fy6df0hm3aj317y06cwim.jpg)

---

## Handwritten notes

![image-20181214165009245](https://ws3.sinaimg.cn/large/006tNbRwly1fy6dfpccgjj31d60bmteo.jpg)

---

## Research Project

You can read sample project [here](https://bingcheng1998.github.io/PDF/Deep-Neural%20Network-and-Its-Applications/Deep-Neural%20Network-and-Its-Applications.html).

---

# Ve370 Introduction to Computer Organization Fall 2018 

Gang Zheng, Ph.D.
 JI New Building 400E
 (021) 3420-6765 x4005, gzheng@sjtu.edu.cn W12:00pm–2:00pm/Th10:00am–12:00pm,orbyappointment A515
 M 2:00 – 3:40pm (even weeks), T/Th 2:00 – 3:40pm
 Ms. ZHAO Yuxin, zhaoyx8024@sjtu.edu.cn
 Mr. FU Xiaohan, reapor.yurnero@sjtu.edu.cn
 Mr. WANG Tianze, wangtianze@sjtu.edu.cn 

## Course Description: 

This course is designed to cover basic concepts of computer organization and hardware; instructions executed by a processor and how to use these instructions in simple assembly- language programs; stored-program concept; datapath and control for multiple implementations of a processor; performance evaluation, pipelining, caches, virtual memory, input/output, parallelism. 

Credits: 4 

Prerequisites: Ve270 and Ve280 

Course Objectives (what will be taught):
 1) To teach students how computers execute machine-level instructions.
 2) To teach students how to write assembly language programs and translate them to 

machine level instructions.
 3) To teach students how to design the datapath and control unit for pipelined and non- 

pipelined processors.
 4) To teach students about data and control hazards.
 5) To teach students the principles of caches and memory.
 6) To teach students how processors, memory, and I/O are combined into a computer. 

## Course Outcomes (what students are expected to achieve): 

1. 1)  Given a simple programming task and an instruction-set architecture, write an assembly 

   language program that implements the task, translate the assembly-language program into 

   machine-level instructions, and trace the execution of the program. 

2. 2)  Model the computer hardware including datapath and control logic for a given instruction- 

   set architecture, both for a single-cycle and pipelined processor, by using schematic 

   capturing tools or hardware description languages (HDLs). 

3. 3)  Be able to identify and resolve potential data, control, and structural hazards 

1. 4)  Understand the memory hierarchy including cache, main memory, hard disk, and how data is stored in that hierarchical structure, and be able to recognize memory hits and misses 

2. 5)  Understand the memory mapped I/O concept and how I/O devices interface the CPU 

3. 6)  Be able to use library and internet resources for literature research to learn the current 

   issues, technologies, and future development trends in computing 

## Textbook: 

David Patterson and John Hennessy, Computer Organization and Design - Hardware/Software Interface, 4th edition, Morgan Kaufmann, 2008, ISBN 978-0-12-374493-7 

## Course Policies: 

- Honor Code: All students in the class are bound by the Honor Code of the Joint Institute (see the related sections in JI Student Handbook for details). You may not seek to gain an unfair advantage over your fellow students; you may not consult, look at, or possess the unpublished work of another without their permission; and you must appropriately acknowledge your use of another's work. 

- Attendance: Attendance will be randomly taken. 5% will be deducted from the final grade for each absence starting from the 4th one. 

- Participation: Active participation in course meetings is expected for all students. With each submitted assignment, students should be prepared to explain their solutions to the class. 

- Submission: Project reports are due on the specified date. The instructor reserves the right to waive the penalty for emergencies (e.g. hospitalization) or arrangement made with the instructor 24 hours prior to the due date. 

- Individual Assignments: Project 1 and 3 and homework for literature search are individual assignments. Students are encouraged to discuss course topics and help each other understand the project/homework requirements better. However, all submissions must represent your own work. Duplicated submission is absolutely not allowed and will trigger an honor code violation investigation. 

- Group Assignments: Project 2 is a team effort. The work submitted must reflect the work of the team. The grade for a group assignment will be shared among the entire team equally, unless specified differently. 

  ## Course Outline: (Tentative and subject to adjustment.) 

| Week | Date                                   | Topics                                        | Reading                 |
| ---- | -------------------------------------- | --------------------------------------------- | ----------------------- |
| 1    | 9/11                                   | Course Introduction, introduction to computer | 1, Lecture Notes        |
| 9/13 | MIPS assembly, operations and operands | 2.1-2.3, 2.6, 2.7                             |                         |
| 2    | 9/17                                   | MIPS assembly, operations and operands        |                         |
| 9/18 | Instruction coding, addressing mode    | 2.5, 2.9, 2.10, B.10                          |                         |
| 9/20 | Instruction coding, addressing mode    |                                               |                         |
| 3    | 9/25                                   | Procedure calling conventions (Project 1)     | 2.8, 2.12-2.14, B.1-B.4 |
| 9/27 | Procedure calling conventions          |                                               |                         |
| 4    | 10/2                                   | National Holiday, no class                    |                         |
| 10/3 | National Holiday, no class             |                                               |                         |
| 10/5 | National Holiday, no class             |                                               |                         |
| 5     | 10/9                           | Digital Logic Review, single cycle processor | 4.1-4.4      |
| 10/11 | Single cycle processor         |                                              |              |
| 6     | 10/15                          | Pipelined datapath and control (Project2)    | 4.5, 4.6     |
| 10/16 | Pipelined datapath and control |                                              |              |
| 10/18 | Data hazards                   | 4.7                                          |              |
| 7     | 10/23                          | Data hazards                                 |              |
| 10/25 | Data hazards                   |                                              |              |
| 8     | 10/29                          | Midterm Exam                                 |              |
| 10/30 | Control hazards                | 4.8                                          |              |
| 11/1  | Control hazards                |                                              |              |
| 9     | 11/6                           | Control hazards                              |              |
| 11/8  | Exceptions                     | 4.9                                          |              |
| 10    | 11/12                          | Cache memory                                 | 5.1-5.3, 5.7 |
| 11/13 | Cache memory                   |                                              |              |
| 11/15 | Cache memory                   |                                              |              |
| 11    | 11/20                          | Lecture on literature search (Project3)      |              |
| 11/22 | Virtual memory                 | 5.4-5.6, 5.10, 5.12                          |              |
| 12    | 11/26                          | Virtual memory                               |              |
| 11/27 | Virtual memory                 |                                              |              |
| 11/29 | I/Os and interfaces            | 6.1-6.6                                      |              |
| 13    | 12/4                           | I/Os and interfaces                          |              |
| 12/6  | Parallelism, multiprocessors   | 7.1-7.4, 7.11, 9.1                           |              |
| 14    | TBD                            | Final Exam                                   |              |

## Course Assessment Methods: Homework: 

Homework problems are designed for students to revisit and practice the important concepts in computer organization and design. Homework assignments are also assigned for students to gain confidence in solving engineering problems in this class. Tentatively, nine homework sets will be assigned. A specific due date will be given when each homework set is assigned with a deadline. However, homework assignments will NOT be graded. 

## Homework for literature search: 

The ability to search and find literatures relevant to a specific topic is important for conducting research, resolving real-life engineering problems, and continuing one’s intellectual growth in the life time. The homework for literature search is designed for the students to get familiarized with the resources available in a college library physically and online virtually, and to learn tools that may facilitate the searching process. 

## Examination: 

The examinations shall measure the ability to carry out analysis, design, and verification processes of digital circuits and systems. There will be two paper based examinations. The typical types of exam problems include conceptual understanding, computation, procedural development, short answer, analysis and design, and etc. 

## Project: 

The projects are designed for students to practice basic understanding of the pipelined computer architecture, and to give multiple ways to meet the design requirements. In addition, the project utilizes contemporary software tools in aid of design. Documented design outcomes and/or demonstration of the project are required following a prescribed format. Project will be graded on completeness, correctness, effectiveness in analyzing and presenting the outcomes. 

## Grading Policy: 

| Homework for literature search* | 2%   |
| ------------------------------- | ---- |
| Homework*                       | 2%   |
| Midterm Exam                    | 28%  |
| Final Exam                      | 30%  |
| Project 1*                      | 5%   |
| Project 2**                     | 30%  |
| Project 3*                      | 3%   |
| Total                           | 100% |

*Individual assignments* Group assignments 

Note: final letter grades will be curved. 