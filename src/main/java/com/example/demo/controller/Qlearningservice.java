package com.example.demo.controller;
import java.util.*;

import com.example.demo.Model.Dustbin;

public class Qlearningservice {
    // Define constants
    private static final int NUM_EPISODES = 5000; // Increased number of episodes
    private static final double LEARNING_RATE = 0.2; // Adjusted learning rate
    private static final double DISCOUNT_FACTOR = 0.9;

    // Define Q-table
    private double[][][] qTable; // Q-value for each pair of dustbins

    public List<Dustbin> optimizePath(List<Dustbin> dustbins) {
        initializeQTable(dustbins);
        trainQlearning(dustbins);
        return findOptimalPath(dustbins);
    }

    private void initializeQTable(List<Dustbin> dustbins) {
        qTable = new double[dustbins.size()][dustbins.size()][101]; // 101 possible fill levels (0 to 100)
        for (int i = 0; i < dustbins.size(); i++) {
            for (int j = 0; j < dustbins.size(); j++) {
                for (int k = 0; k <= 100; k++) {
                    qTable[i][j][k] = 0.0;
                }
            }
        }
    }

    
    private void trainQlearning(List<Dustbin> dustbins) {
        Random rand = new Random(123); // Set a fixed seed for reproducibility

        for (int episode = 0; episode < NUM_EPISODES; episode++) {
            // Initialize starting state (empty)
            int currentState = -1;

            for (int i = 0; i < dustbins.size(); i++) {
                Dustbin currentDustbin = dustbins.get(i);

                // Update the current state and reward
                int nextState = i;
                double reward = getReward(currentDustbin);

                // Update Q-value for the current state and action
                if (currentState != -1) {
                    qTable[currentState][nextState][(int) currentDustbin.getFillLevel()] +=
                            LEARNING_RATE * (reward + DISCOUNT_FACTOR * getMaxQValue(nextState, currentDustbin.getFillLevel()) - qTable[currentState][nextState][(int) currentDustbin.getFillLevel()]);
                }

                // Move to the next state
                currentState = nextState;
            }
        }
    }


    private double getReward(Dustbin dustbin) {
        // Define reward function based on the fill level of dustbins, distance traveled, etc.
        // For simplicity, let's define a reward of -1 for each step, and a reward of 100 for reaching the final state.
        if (dustbin.isWorking()) {
            return -1;
        } else {
            return 100; // Reward for reaching the final state
        }
    }

    private double getMaxQValue(int nextState, double fillLevel) {
        // Get the maximum Q-value for the given next state and fill level
        double maxQValue = Double.NEGATIVE_INFINITY;

        for (int i = 0; i < qTable.length; i++) {
            for (int j = 0; j <= 100; j++) {
                if (qTable[nextState][i][j] > maxQValue) {
                    maxQValue = qTable[nextState][i][j];
                }
            }
        }

        return maxQValue;
    }

    private List<Dustbin> findOptimalPath(List<Dustbin> dustbins) {
        List<Dustbin> optimalPath = new ArrayList<>();
        boolean[] visited = new boolean[dustbins.size()]; // To keep track of visited dustbins
        int currentState = 0; // Starting from the first dustbin

        while (optimalPath.size() < dustbins.size()) {
            Dustbin currentDustbin = dustbins.get(currentState);
            optimalPath.add(currentDustbin);
            visited[currentState] = true;

            // Find the next dustbin to visit based on the highest Q-value
            double maxQValue = Double.NEGATIVE_INFINITY;
            int nextState = -1;

            for (int i = 0; i < dustbins.size(); i++) {
                if (!visited[i] && getMaxQValue(currentState, currentDustbin.getFillLevel()) > maxQValue) {
                    maxQValue = getMaxQValue(currentState, currentDustbin.getFillLevel());
                    nextState = i;
                }
            }

            currentState = nextState;
        }

        return optimalPath;
    }
}
