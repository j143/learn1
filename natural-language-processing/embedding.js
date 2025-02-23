import React, { useState, useEffect } from 'react';
import { Card, CardHeader, CardTitle, CardContent } from '@/components/ui/card';
import { Tabs, TabsList, TabsTrigger, TabsContent } from '@/components/ui/tabs';
import { ArrowRight, ArrowLeft } from 'lucide-react';

const NeuronLayer = ({ count, active, className }) => (
  <div className={`flex flex-col gap-2 ${className}`}>
    {Array(count).fill(0).map((_, i) => (
      <div 
        key={i}
        className={`w-8 h-8 rounded-full border-2 ${
          active ? 'bg-blue-500 border-blue-600' : 'bg-gray-200 border-gray-300'
        } transition-all duration-500`}
      />
    ))}
  </div>
);

const Arrow = ({ active, direction = "right" }) => {
  const Component = direction === "right" ? ArrowRight : ArrowLeft;
  return (
    <Component 
      className={`transition-all duration-500 ${
        active ? 'text-blue-500' : 'text-gray-300'
      }`} 
      size={24}
    />
  );
};

const WordEmbeddingsArchitecture = () => {
  const [step, setStep] = useState(0);
  const [isPlaying, setIsPlaying] = useState(false);

  useEffect(() => {
    let interval;
    if (isPlaying) {
      interval = setInterval(() => {
        setStep((prev) => (prev + 1) % 4);
      }, 2000);
    }
    return () => clearInterval(interval);
  }, [isPlaying]);

  const architectures = {
    skipgram: {
      title: "Skip-gram Architecture",
      steps: [
        { description: "Input word 'bank' is one-hot encoded" },
        { description: "Projection layer creates word embedding" },
        { description: "Output layer predicts context words" },
        { description: "Multiple context words are predicted simultaneously" }
      ],
      render: (activeStep) => (
        <div className="flex items-center justify-center gap-8 p-4">
          <div className="text-center">
            <div className="mb-2">Input Word</div>
            <NeuronLayer count={5} active={activeStep >= 0} />
          </div>
          <Arrow active={activeStep >= 1} />
          <div className="text-center">
            <div className="mb-2">Embedding</div>
            <NeuronLayer count={3} active={activeStep >= 1} />
          </div>
          <Arrow active={activeStep >= 2} />
          <div className="text-center">
            <div className="mb-2">Context Predictions</div>
            <div className="flex gap-4">
              <NeuronLayer count={5} active={activeStep >= 2} />
              <NeuronLayer count={5} active={activeStep >= 3} />
              <NeuronLayer count={5} active={activeStep >= 3} />
            </div>
          </div>
        </div>
      )
    },
    cbow: {
      title: "CBOW Architecture",
      steps: [
        { description: "Multiple context words are input" },
        { description: "Context words are averaged in projection layer" },
        { description: "Embedding is created from averaged context" },
        { description: "Target word is predicted" }
      ],
      render: (activeStep) => (
        <div className="flex items-center justify-center gap-8 p-4">
          <div className="text-center">
            <div className="mb-2">Context Words</div>
            <div className="flex gap-4">
              <NeuronLayer count={5} active={activeStep >= 0} />
              <NeuronLayer count={5} active={activeStep >= 0} />
              <NeuronLayer count={5} active={activeStep >= 0} />
            </div>
          </div>
          <Arrow active={activeStep >= 1} />
          <div className="text-center">
            <div className="mb-2">Average</div>
            <NeuronLayer count={3} active={activeStep >= 1} />
          </div>
          <Arrow active={activeStep >= 2} />
          <div className="text-center">
            <div className="mb-2">Target Word</div>
            <NeuronLayer count={5} active={activeStep >= 3} />
          </div>
        </div>
      )
    },
    fasttext: {
      title: "FastText Architecture",
      steps: [
        { description: "Word is split into character n-grams" },
        { description: "Each n-gram gets its own embedding" },
        { description: "N-gram embeddings are averaged" },
        { description: "Final word representation is produced" }
      ],
      render: (activeStep) => (
        <div className="flex items-center justify-center gap-8 p-4">
          <div className="text-center">
            <div className="mb-2">N-grams</div>
            <div className="flex gap-4">
              <div className="text-sm">
                <div>ba-</div>
                <NeuronLayer count={3} active={activeStep >= 0} />
              </div>
              <div className="text-sm">
                <div>-an-</div>
                <NeuronLayer count={3} active={activeStep >= 0} />
              </div>
              <div className="text-sm">
                <div>-nk</div>
                <NeuronLayer count={3} active={activeStep >= 0} />
              </div>
            </div>
          </div>
          <Arrow active={activeStep >= 1} />
          <div className="text-center">
            <div className="mb-2">N-gram Embeddings</div>
            <div className="flex gap-4">
              <NeuronLayer count={3} active={activeStep >= 2} />
              <NeuronLayer count={3} active={activeStep >= 2} />
              <NeuronLayer count={3} active={activeStep >= 2} />
            </div>
          </div>
          <Arrow active={activeStep >= 2} />
          <div className="text-center">
            <div className="mb-2">Word Embedding</div>
            <NeuronLayer count={3} active={activeStep >= 3} />
          </div>
        </div>
      )
    },
    elmo: {
      title: "ELMo Architecture",
      steps: [
        { description: "Input sequence of words" },
        { description: "Bi-directional LSTM processes sequence" },
        { description: "Multiple layer representations are computed" },
        { description: "Final embedding combines all layers" }
      ],
      render: (activeStep) => (
        <div className="flex items-center justify-center gap-8 p-4">
          <div className="text-center">
            <div className="mb-2">Input Sequence</div>
            <div className="flex flex-col gap-2">
              <div className="text-sm">The</div>
              <div className="text-sm">bank</div>
              <div className="text-sm">approved</div>
            </div>
          </div>
          <Arrow active={activeStep >= 1} />
          <div className="text-center">
            <div className="mb-2">BiLSTM Layers</div>
            <div className="flex gap-4">
              <NeuronLayer count={4} active={activeStep >= 1} />
              <NeuronLayer count={4} active={activeStep >= 2} />
              <NeuronLayer count={4} active={activeStep >= 2} />
            </div>
          </div>
          <Arrow active={activeStep >= 2} />
          <div className="text-center">
            <div className="mb-2">Contextual Embedding</div>
            <NeuronLayer count={4} active={activeStep >= 3} />
          </div>
        </div>
      )
    }
  };

  return (
    <Card className="w-full max-w-4xl">
      <CardHeader>
        <CardTitle>Word Embedding Architectures</CardTitle>
        <div className="flex gap-4 items-center">
          <button
            onClick={() => setIsPlaying(!isPlaying)}
            className={`px-4 py-2 rounded ${
              isPlaying ? 'bg-red-500 text-white' : 'bg-blue-500 text-white'
            }`}
          >
            {isPlaying ? 'Pause' : 'Play Animation'}
          </button>
          <button
            onClick={() => setStep((prev) => (prev + 1) % 4)}
            className="px-4 py-2 rounded bg-gray-200"
            disabled={isPlaying}
          >
            Next Step
          </button>
        </div>
      </CardHeader>
      <CardContent>
        <Tabs defaultValue="skipgram">
          <TabsList className="grid w-full grid-cols-4">
            {Object.keys(architectures).map((model) => (
              <TabsTrigger 
                key={model} 
                value={model}
                onClick={() => setStep(0)}
              >
                {model.toUpperCase()}
              </TabsTrigger>
            ))}
          </TabsList>

          {Object.entries(architectures).map(([modelKey, modelData]) => (
            <TabsContent key={modelKey} value={modelKey}>
              <Card>
                <CardHeader>
                  <CardTitle>{modelData.title}</CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="mb-4 p-4 bg-blue-50 rounded">
                    Step {step + 1}: {modelData.steps[step].description}
                  </div>
                  {modelData.render(step)}
                </CardContent>
              </Card>
            </TabsContent>
          ))}
        </Tabs>
      </CardContent>
    </Card>
  );
};

export default WordEmbeddingsArchitecture;