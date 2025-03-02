
Feature: Github Application

Background:
  * def perfMgr = Java.type('examples.PerfManager')

Scenario: Github Login
  * def p1 = perfMgr.startPerfEvent('GitHub: Launch Website')
  Given driver 'https://github.com/login'
  * perfMgr.stopPerfEvent(p1, {}, karate)
  And driver.input('#login_field', 'milind.trivedi@gmail.com')
  And driver.input('#password', '12345')
  * def p2 = perfMgr.startPerfEvent('GitHub: Login with Username and Password')
  When driver.click("input[name=commit]")
  * perfMgr.stopPerfEvent(p2, {}, karate)
  Then match html('#js-flash-container') contains 'Incorrect username or password.'