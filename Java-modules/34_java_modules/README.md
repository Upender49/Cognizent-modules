# Java Modules (JPMS)

## Compile
```bash
javac -d out --module-source-path . $(find . -name "*.java")
```

## Run
```bash
java --module-path out -m com.greetings/com.greetings.Main
```
