class Badge {
    public String print(Integer id, String name, String department) {
        var res = new StringBuilder();

        if (id != null) res.append("[").append(id).append("]").append(" - ");
        if (name != null) res.append(name);
        res.append(" - ");
        if (department != null) res.append(department.toUpperCase());
        else res.append("OWNER");
        
        return res.toString();
    }
}
