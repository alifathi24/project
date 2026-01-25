import java.time.LocalDate;

public class Expense {
    private final LocalDate date;
    private final String category;
    private final double amount;
    private final String note;

    public Expense(LocalDate date, String category, double amount, String note) {
        this.date = date;
        this.amount = amount;

        if (category == null || category.trim().isEmpty()) {
            this.category = "Uncategorized";
        } else {
            this.category = category.trim();
        }
        
        if (note == null) {
            this.note = "";
        } else {
            this.note = note.trim();
        }
            

    }

    public LocalDate getDate() {
        return date;
    }
    public String getCategory() {
        return category;
    }
    public double getAmount() {
        return amount;
    }
    public String getNote() {
        return note;
    }

    @Override 
    public String toString() {
        String base = date + " | " + category + " | $" + String.format("%.2f", amount);

        if (note.isBlank()) {
            return base;
        }

        return base + " | " + note;
    }
}