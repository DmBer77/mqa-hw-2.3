//
//  Created by Netology.
//

import XCTest

class NetologyUITests: XCTestCase {

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()

        let username = "username"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")

        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()

        let predicate = NSPredicate(format: "label CONTAINS[c] %@", username)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)

        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }

       func testCleaningLoginField() throws {
        let app = XCUIApplication()
        app.launch()

        let username = "username"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(username)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("123456")

        loginTextField.tap()
        loginTextField.typeText("")

        let loginButton = app.buttons["login"]
        XCTAssertFalse(loginButton.isEnabled)
              
        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }

     func testLoginTwice() throws {
        let app = XCUIApplication()
        app.launch()

        let firstUsername = "firstUsername"
        let firstPassword = "123456"
        let secondUsername = "secondUsername"
        let secondPassword = "654321"

        let loginTextField = app.textFields["login"]
        loginTextField.tap()
        loginTextField.typeText(firstUsername)

        let passwordTextField = app.textFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(firstPassword)

        let loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()

        let predicate = NSPredicate(format: "label CONTAINS[c] %@", firstUsername)
        let text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)

        app.navigationBars.buttons.element(boundBy: 0).tap()

        loginTextField.tap()
        loginTextField.typeText(secondUsername)

        passwordTextField.tap()
        passwordTextField.typeText(secondPassword)

        loginButton = app.buttons["login"]
        XCTAssertTrue(loginButton.isEnabled)
        loginButton.tap()

        predicate = NSPredicate(format: "label CONTAINS[c] %@", secondUsername)
        text = app.staticTexts.containing(predicate)
        XCTAssertNotNil(text)

        let fullScreenshot = XCUIScreen.main.screenshot()
        let screenshot = XCTAttachment(screenshot: fullScreenshot)
        screenshot.lifetime = .keepAlways
        add(screenshot)
    }
}
