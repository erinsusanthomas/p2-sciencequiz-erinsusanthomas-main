67-272: ScienceQuiz App
===

This code is for the ScienceQuiz project assigned to Information Systems students at Carnegie Mellon University in 67-272 during the Spring 2021 semester (In both Pittsburgh and Qatar). <!--More information about this project can be found at [https://67272.cmuis.net/projects](https://67272.cmuis.net/projects).-->

Additional documentation for the requirements of this phase and technical documents to guide student work can be found in the `docs` directory of this project.  Please be sure to read carefully all the project notes below.  <!--In addition, if there are any notes the students wants to communicate to the teaching staff, please use the student notes section at the very bottom for this purpose.-->


Project Notes: Phase 2
---
In this phase, we will continue our project to develop a foundation for the ScienceQuiz system. In this phase, we will focus our efforts on building the models **for the four entities** given to you in the first ERD and adding all necessary business logic. In addition, you will have to write unit tests for all models. This phase will constitute **7% of your final course grade** and is broken down into the following three components:

1. **Creation of Models**: In the starter code, we have provided you an ERD, a database design, and a data dictionary, along with a set of project specs.  These documents are all located in the `docs` directory of your starter repository.  All these documents are useful in this phase -- in some cases, they have overlapping coverage, but sometimes key ideas are found only in one of these documents. You are responsible for what is on all of the documents provided. 

2. **Unit Testing**: Unit tests for all methods in all models must be written and fully passing. We will check to make sure there is 100% code coverage for unit tests using the `simplecov` gem used in class and in lab. Because `simplecov` does suffer from some false positives (as mentioned in class) we may spot check tests to make sure certain tests were included. Only the models in this phase need complete coverage. There are steep penalties for less than 100% coverage and no credit at all for less than 90% coverage -- see below for more details, but this is a critical aspect of this phase. 

**Note**: We will cover this part on Sunday February 21st. 

3. **Coding Style**: All code must be appropriately organized. What that means at this stage is the following: Related or similar functionality is grouped or clustered together. Indentation should be used consistently to make code readable. Comments showing organization should be present and explaining difficult code should be used when/if necessary.

**A few notes on grading this phase:**

1.	There is a strong emphasis on unit testing in this phase.  As noted earlier, we are using the SimpleCov test coverage tool and it has already been configured in your starter code.  If your project has less than 100% test coverage according to this tool, expect an automatic 15 point penalty on your project.  If your level of test coverage drops below 90%, expect an additional penalty of 20 points.  These penalties are steep because we are extremely serious about the need for complete test coverage and they will not be waived for any reason.  You can run your tests yourself in advance and confirm your level of coverage before submission.

2. Your own tests must pass -- it is not a good look to submit an assignment that has tests that don't pass.  It's as if you are telling us that you know what the code should do, but couldn't be bothered to adhere to that standard.  We will assess a minimum 10 point penalty if any of the tests you write cannot pass; if you have more than 5 failing tests we reserve the right to increase this penalty.  All total, your tests running and passing with 100% test coverage will constitute 45 points of the phase grade.

3. As mentioned above and in class, the SimpleCov tool is prone to false positive results.  For that reason, once the project deadline hits, we will run your tests (to verify they pass and that you have 100% test coverage) and then we will run our tests, which we know are comprehensive.  We cannot reveal these tests in advance as it would undermine your learning about how to write tests.  (At the same time, they will not be unlike the tests you see in the PATS project, so it is not as if you are completely clueless about our tests.)  Running our tests on your system will constitute 50 points of the phase grade.

4. We will be assessing automatic penalties for each of our tests that fail.  For the first test in a model that fails, a small penalty will be incurred on that model and that penalty will grow as more model tests fail.  It happens sometimes that if one test fails, other tests will fail in a cascading fashion.  Given that, for pedagogical reasons, you don't have access to our tests, the teaching staff believes the wisest course of action is not to build a minimal test set and context (as many students do), but to build a maximal test set that may even over-test at times to make sure you truly have covered everything.  Our test suite has hundreds of tests for these models to make sure we have covered all contingencies; creating your test suite that is much smaller is viable, but risks missing an error that leads to a cascading fail.
  
5. Code quality as discussed above will constitute 5 points on this project.

6. The project starter code uses Rails 5.2.4.4 and Ruby 2.6.3, as well as simplecov 0.21.2.  Changing any of these key settings (or the `SimpleCov.start` settings in `test_helper.rb`) will result in an automatic zero.  Likewise, we will only grade code on the `master` branch of your repository; you are welcomed (and encouraged) to create other branches, but in the end, your fully-tested code must reside on the `master` branch to receive proper credit.

7. You have a private repository on GitHub for this project which is accessible (initially) only to you and the teaching staff.  If you change the visibility of your repository in any way or give any other individuals outside the faculty and TA access (directly or indirectly) to this repository, you can expect an automatic zero for this project, an additional one-letter grade drop on the final grade, and this will be considered an academic violation that will be reported to the University.  _We will use the full range of monitoring tools that GitHub provided to classrooms to actively scan for such violations._

8. Your project will be turned in via GitHub no later than **Tuesday, March 9, 2021 11:59pm**. Any late submissions will be not be considered (we can and will roll back any late submissions) and even making a late submission will be an automatic 5 point penalty, just for making us go through the hassle of performing a rollback.  More information about the turn-in process will be discussed later in labs. 

Again, if you have questions regarding this project, please post them on Piazza or ask someone well in advance of the turn-in date. Waiting until the day before it is due to get help is unwise -- you risk not getting a timely response that close to the deadline and will not be given an extension because of such an error.

**Checkpoints for this phase**:

- _Checkpoint 1:_ One model of your choice must be written by **Monday, February 22nd, 2021 5:00pm**. The Model to be written is at the student's discretion.  Students will show model code to an assigned CA/TA. The CA/TA will not grade the code, just verify that the model was able to pass the tests manually. Failure to pass parts of the totality of the tests will incur a penalty over the checkpoint. In the case the model is ready before the 22nd, feel free to contact the CA and validate the checkpoint with him/her.

- _Checkpoint 2:_ One additional model of your choice must be written and tested by **Thursday, February 25th, 2021 5:00pm**. (Test requirement may be waived depending on class progress.) The additional model to be written and tested is at the student's discretion.  Students will show model code and demonstrate the tests pass to the assigned CA/TA.  The CA/TA will not grade the code or review test coverage, just verify that the model was able to pass the test. Failure to pass parts of the totality of the tests will incur a penalty over the checkpoint. In the case the model is ready before the 25th, feel free to contact the CA and validate the checkpoint with him/her.

