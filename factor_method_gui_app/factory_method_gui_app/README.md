# factory_method_gui_app




1. Single Responsibility Principle (SRP): The Factory Method pattern adheres to the SRP as it separates the responsibility of creating objects from their usage. The Factory Method is responsible for creating objects (the "Single Responsibility") while the client code using the created objects is responsible for their usage.
2. Open/Closed Principle (OCP): The Factory Method pattern supports the OCP by allowing the addition of new product classes without modifying the existing client code. When a new product needs to be added, you can simply create a new Concrete Creator (Factory) without changing the existing client code.
3. Liskov Substitution Principle (LSP): The Factory Method pattern is compatible with the LSP, as the client code interacts with products through their common abstract interface. This allows the client code to work seamlessly with any Concrete Product created by the corresponding Concrete Creator.
4. Interface Segregation Principle (ISP): The Factory Method pattern doesn't directly address the ISP as it is more focused on creational concerns. However, it's worth noting that the Factory Method pattern inherently segregates the responsibility of object creation into separate classes, which indirectly aligns with the ISP's idea of having specific interfaces for specific tasks.
5. Dependency Inversion Principle (DIP): The Factory Method pattern adheres to the DIP by ensuring that the client code depends on the abstract Creator interface (high-level module) rather than concrete product classes (low-level modules). This abstraction allows for flexibility and extensibility in creating new products without affecting the client code

![uml](https://github.com/hcakil/design_patterns/assets/48150826/84d221f7-4921-4ba7-a6e8-4eb19884989d)
