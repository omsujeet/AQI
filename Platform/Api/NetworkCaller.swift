//
//  HomeScreenUseCase.swift
//  AQI
//
//  Created by Sujeet on 25/04/22.
//

import Foundation

public class NetworkCaller: NSObject, URLSessionWebSocketDelegate {
    static let shared = NetworkCaller()
    private var session: URLSession?
    let url = URL(string: "ws://city-ws.herokuapp.com/")!
    var webSocketTask: URLSessionWebSocketTask?
    var response: ((String?) -> ())?
    private override init() {
    }
    
    
    func createWebSocketTask() {
        session = URLSession(configuration: .default, delegate: self , delegateQueue: OperationQueue())
        webSocketTask = session?.webSocketTask(with: url)
        webSocketTask?.resume()
    }
    
    func ping() {
      webSocketTask?.sendPing { error in
        if let error = error {
          print("Error when sending PING \(error)")
        } else {
            print("Web Socket connection is alive")
            DispatchQueue.global().asyncAfter(deadline: .now() + 30) { [weak self] in
                self?.ping()
            }
        }
      }
    }
    
    func close() {
      let reason = "Closing connection".data(using: .utf8)
      webSocketTask?.cancel(with: .goingAway, reason: reason)
    }
    
    func receive() {
        webSocketTask?.receive { [weak self] result in
        switch result {
        case .success(let message):
          switch message {
          case .data(let data):
            print("Data received \(data)")
          case .string(let text):
              self?.response?(text)
//            print("Text received \(text)")
          }
        case .failure(let error):
          print("Error when receiving \(error)")
        }
        
            self?.receive()
      }
    }
    
    
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Web Socket did connect")
        ping()
        receive()
    }
    
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Web Socket did disconnect")
    }
    
   
    
}
