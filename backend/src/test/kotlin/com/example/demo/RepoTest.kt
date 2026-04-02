package com.example.demo

import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.data.jpa.test.autoconfigure.DataJpaTest
import org.springframework.data.repository.findByIdOrNull

@DataJpaTest
class RepoTest {

    @Autowired
    lateinit var taskRepository: TaskRepository

    @Test
    fun testAddTask() {
        val task = Task(title = "Test Task", description = "Test description")
        val saved = taskRepository.save(task)
        val a = taskRepository.findByIdOrNull(saved.id)
        assert(a?.id == task.id)
    }
}

















