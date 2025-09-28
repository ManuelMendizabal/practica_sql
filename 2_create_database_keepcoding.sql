CREATE TABLE learning_program (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(125) NOT NULL,
    description VARCHAR(255),
    start_date DATE NOT NULL,
    end_date DATE,
    type VARCHAR(20) NOT NULL CHECK (type IN ('course','bootcamp')),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);


CREATE TABLE module(
   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
   name VARCHAR(125) NOT NULL,
   description VARCHAR(255),
   is_main BOOLEAN DEFAULT false,
   created_at TIMESTAMP DEFAULT now(),
   updated_at TIMESTAMP DEFAULT now(),
   deleted_at TIMESTAMP
);

CREATE TABLE learning_program_module (
    learning_program_id UUID NOT NULL REFERENCES learning_program(id),
    module_id UUID NOT NULL REFERENCES module(id),
    position int,
    created_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP,
    PRIMARY KEY (learning_program_id, module_id)
);

CREATE TABLE teacher (
   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
   name VARCHAR(125) NOT NULL,
   area VARCHAR(100),
   created_at TIMESTAMP DEFAULT now(),
   updated_at TIMESTAMP DEFAULT now(),
   deleted_at TIMESTAMP
);

CREATE TABLE student (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(125) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

CREATE TABLE module_teacher(
    module_id UUID NOT NULL REFERENCES module(id),
    teacher_id UUID NOT NULL REFERENCES teacher(id),
    created_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP,
PRIMARY KEY (module_id, teacher_id)
);

CREATE TABLE enrollment(
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    student_id UUID NOT NULL REFERENCES student(id),
    learning_program_id UUID NOT NULL REFERENCES learning_program(id),
    modality VARCHAR(20) NOT NULL CHECK (modality IN ('live','recorded')),
    status VARCHAR(20) NOT NULL CHECK (status IN ('active','completed','dropped')),
    enrolled_at TIMESTAMP DEFAULT now(),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

CREATE TABLE class (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    module_id UUID NOT NULL REFERENCES module(id),
    teacher_id UUID NOT NULL REFERENCES teacher(id),
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    class_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

CREATE TABLE task (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    module_id UUID NOT NULL REFERENCES module(id),
    title VARCHAR(200) NOT NULL,
    available_date DATE NOT NULL,
    due_date DATE NOT NULL,
    extraordinary_due_date DATE,
    mandatory BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now(),
    deleted_at TIMESTAMP
);

CREATE TABLE submission(
   id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
   task_id UUID NOT NULL REFERENCES task(id),
   student_id UUID NOT NULL REFERENCES student(id),
   submitted_at TIMESTAMP NOT NULL,
   result NUMERIC(5,2) CHECK (result >= 0 AND result <= 10),
   status VARCHAR(20) NOT NULL CHECK (status IN ('pending','submitted','reviewed')),
   created_at TIMESTAMP DEFAULT now(),
   updated_at TIMESTAMP DEFAULT now(),
   deleted_at TIMESTAMP
);