const apickli = require('apickli')
const yaml = require('js-yaml');

const {
  Before,
  Given,
  When,
  Then,
  After,
  setDefaultTimeout
} = require('cucumber')
const fs = require('fs')
const { getInputData } = require('./utils');

function fetchProxyNameAndExecuteTests() {

  const { inputData } = getInputData;
  let data = inputData;
  const proxy = data.Proxy;
  console.log(`Proxy Data:${JSON.stringify(proxy)}`);
  const proxyBasePath = proxy.proxyBasePath;
  console.log("Proxy Base Path: " + proxyBasePath);

  return proxyBasePath;
}


const org = process.env.APIGEE_ORGANIZATION
console.log("Organization Passed :: " + org);
const env = process.env.APIGEE_ENVIRONMENT
console.log("Environment Passed :: " + env);
const proxy = fetchProxyNameAndExecuteTests();

Before(function () {
  this.apickli = new apickli.Apickli('https', org + '-' + env + '.apigee.net' + proxy)
  this.apickli.fixturesDirectory = './test/fixtures'
  // this.apickli.scenarioVariables.foo = 'bar'; // example
})

When('I use an expression that apickli does not support', async function () {

})

Then(/^I can use regex to pickup values like (.*) from the expression$/, function (uri, cb) {
  // and I would perform custom test steps and assertions in these code blocks
})

setDefaultTimeout(60 * 1000)
