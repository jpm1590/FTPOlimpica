import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.*;
import javax.swing.text.*;

public class Other extends JApplet {

    JTextField JTextField1;
    JScrollPane jScrollPane1;
    JLabel JLabel1;
    JTextArea JTextArea1;

    Color colorfondodefault;
    Highlighter hilit;
    Highlighter.HighlightPainter painter;
    JPanel JPanel1;

    @Override
    public void init() {

        JTextField1 = new JTextField();
        JTextArea1 = new JTextArea();
        JLabel1 = new JLabel();
        JLabel1.setText("Digite la palabra a buscar.");

        JTextArea1.setColumns(20);
        JTextArea1.setLineWrap(true);
        JTextArea1.setRows(5);
        JTextArea1.setWrapStyleWord(true);
        JTextArea1.setEditable(false);

        jScrollPane1 = new JScrollPane(JTextArea1);

        JTextArea1.setText("Java Zone es una pagina dedicada al estudio de la progra"
                + "macion Java, por medio de codigos, imagenes, Applets. Aqui "
                + "encontraras lo que necesitas.");

        hilit = new DefaultHighlighter();
        painter = new DefaultHighlighter.DefaultHighlightPainter(Color.CYAN);
        JTextArea1.setHighlighter(hilit);

        colorfondodefault = JTextField1.getBackground();

        JTextField1.addKeyListener(new KeyListener() {

            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
                    hilit.removeAllHighlights();
                    JTextField1.setText("");
                    JTextField1.setBackground(colorfondodefault);
                }
            }

            @Override
            public void keyReleased(KeyEvent e) {
                // TODO Auto-generated method stub
                buscarTexto();
            }

            @Override
            public void keyTyped(KeyEvent e) {
                // TODO Auto-generated method stub
            }
        });

        JPanel1 = (JPanel) getContentPane();
        JPanel1.add(JTextField1, BorderLayout.NORTH);
        JPanel1.add(jScrollPane1);
        JPanel1.add(JLabel1, BorderLayout.SOUTH);

    }

    public void buscarTexto() {

        hilit.removeAllHighlights();
        String s = JTextField1.getText();

        if (s.length() > 0) {
            String contenido = JTextArea1.getText();
            int index = contenido.indexOf(s, 0);
            if (index >= 0) {
                try {
                    int end = index + s.length();
                    hilit.addHighlight(index, end, painter);
                    JTextArea1.setCaretPosition(end);
                    JTextField1.setBackground(colorfondodefault);
                    JLabel1.setText("'" + s + "' fue encontrado. Presione ESC "
                            + "para finalizar la busqueda.");
                } catch (BadLocationException e) {
                    e.printStackTrace();
                }
            } else {
                JTextField1.setBackground(Color.ORANGE);
                JLabel1.setText("'" + s + "' no se ha encontrado. Presione ESC "
                        + "para finalizar la busqueda.");
            }
        } else {
            JLabel1.setText("Digite la palabra a buscar.");
        }
    }
}
