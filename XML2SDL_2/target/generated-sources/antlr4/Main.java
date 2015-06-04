import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.tool.*;

public class Main {
    public static void main(String[] args) {
        try{
            Grammar g = Grammar.load("comp.g4");
            LexerInterpreter lexer = g.createLexerInterpreter(new ANTLRFileStream("airport_porto.xml"));
            compParser parser = new compParser(new CommonTokenStream(lexer));
            ParseTree tree = parser.start();
            ParseTreeWalker walker = new ParseTreeWalker();
            MyCompListener listener = new MyCompListener();
            walker.walk(listener, tree);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

    }
}