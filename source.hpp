#include <string>

typedef enum reloptype {
    EQUALS,
    NOT_EQUALS,
    SMALLER,
    BIGGER,
    SMALLER_EQUALS,
    BIGGER_EQUALS
};
typedef enum binoptype {
    PLUS,
    MINUS,
    MUL,
    DIV
};

struct Node {
    virtual std::string prettyPrint();
};

class Relop : public Node {
    enum reloptype type;
    Relop(enum reloptype t) : type(t) {}
};
class Binop : public Node {
    enum binoptype type;
    Binop(enum binoptype t) : type(t) {}
};
class ID : public Node {
    std::string value;
    ID(std::string text) : value(text) {}
};

class Num : public Node {
private:
    std::string value;
public:
    Num(std::string text) : value(text) {}
    int getNumber() {
        return std::stoi(value);
    }
};

class String : public Node {
    std::string value;
    String(std::string text) : value(text) {}
};

#define YYSTYPE Node*

