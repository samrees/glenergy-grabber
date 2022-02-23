#!/usr/bin/env ruby

require "selenium-webdriver"

profile = Selenium::WebDriver::Firefox::Profile.new.tap do |p|
  p['browser.download.dir'] = Dir.pwd
  p['browser.download.folderList'] = 2
  p['browser.helperApps.neverAsk.saveToDisk'] = "application/pdf"
  p['pdfjs.disabled'] = true
end

options = Selenium::WebDriver::Firefox::Options.new(profile: profile)
driver = Selenium::WebDriver.for :firefox, capabilities: options
driver.manage.timeouts.implicit_wait = 5
wait = Selenium::WebDriver::Wait.new(timeout: 60)

driver.navigate.to "https://glenergy.smarthub.coop/Login.html#"

wait.until{ driver.find_element(class: "version-label").displayed? }

username_input = driver.find_element(id: 'LoginUsernameTextBox')
password_input = driver.find_element(id: 'LoginPasswordTextBox')
login_button = driver.find_element(id: 'LoginSubmitButton')

username_input.send_keys(ENV["GLE_USERNAME"])
password_input.send_keys(ENV["GLE_PASSWORD"])
login_button.click

wait.until{ driver.find_element(id: 'ViewBillingHistoryLink').displayed? }
sleep 10

nav1 = driver.find_element(id: 'ViewBillingHistoryLink')
nav1.click

wait.until { driver.find_element(css: "tr[__gwt_row='11']").displayed? }

r0 = driver.find_element(css: "tr[__gwt_row='0']")
vb = r0.find_element(partial_link_text: "View Bill")
vb.click
sleep 10

timeout = 120
counter = 0
while Dir.glob("*.part").any? || counter > timeout
  sleep 1
  counter += 1
end

driver.quit
