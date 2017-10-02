require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome

##insert CA's fqdn into fqdn variable
fqdn = "ca.contoso.con"
driver.navigate.to "http://" + fqdn + "/certsrv/certrqxt.asp"
CertField = driver.find_element(:id, "locTaRequest")
CertField.send_keys(:control, "v") #paste copied CSR from clipboard
TemplateField = driver.find_element(:id, "lbCertTemplateID")
TemplateField.click
TemplateField.send_keys(:end, :enter)
SubmitButton = driver.find_element(:id, "btnSubmit")
SubmitButton.click
Encode64Radio = driver.find_element(:id, "rbB64Enc")
Encode64Radio.click
DownloadLink = driver.find_element(:id, "locDownloadCert3")
DownloadLink.click

##open 2nd browser window to show decoded CSR info (optional)
driver2 = Selenium::WebDriver.for :chrome
driver2.navigate.to "https://www.sslshopper.com/csr-decoder.html"
CSRDecoderField = driver2.find_element(:id, "csrBox")
CSRDecoderField.send_keys(:control, "v", :tab) #paste CSR
