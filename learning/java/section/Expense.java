import java.math.BigDecimal;
import java.time.LocalDate;

public class Expense {
    private final LocalDate date;
    private final String category;
    private final BigDecimal amount;
    private final String note;

    public Expense(LocalDate date, String category, BigDecimal amount, String note) {
        this.date = date;
        this.category = category;
        this.amount = amount;
        this.note = note;
    }
}