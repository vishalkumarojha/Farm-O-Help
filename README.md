# Farm-O-Help 🌿

Farm-O-Help is an intelligent plant disease detection system built using **TensorFlow**, with deployment interfaces via **Streamlit**, **Flask API**, and a **Flutter mobile app**. It uses image classification to identify a wide range of plant diseases from leaf images.

* 🚀 **Model Accuracy**: \~99.96%
* 📊 **Dataset**: [New Plant Diseases Dataset](https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset)
* 🧠 **Framework**: TensorFlow (model trained on Google Colab)
* 🧪 **Test & Run**: Streamlit App + Flask API + Flutter App

---

## 🌱 Dataset

We use the [New Plant Diseases Dataset](https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset) from Kaggle which contains:

* Over **87,900 images** (RGB, 256x256 pixels)
* 38 classes of plant diseases and healthy conditions
* Crops like Apple, Grapes, Corn, Tomato, and more
* Pre-split into training (70,295 images) and validation (17,572 images)

---

## 🧠 Model Overview

* **Model File**: `model.h5`
* Built using TensorFlow (Keras API)
* Architecture includes:

  * `DepthwiseConv2D`, `Conv2D`, `MaxPooling2D`
  * `GlobalAveragePooling2D`, `Dropout`, `Dense` layers
* Trained in Google Colab
* Achieved **99.96% accuracy** on the validation set

---

## 💻 Streamlit Web App

### 🔧 Setup Instructions

```bash
# Clone the repo
git clone https://github.com/vishalkumarojha/Farm-O-Help.git
cd Farm-O-Help

# Create a virtual environment
python -m venv myenv

# Activate the environment
# On Windows:
myenv\Scripts\activate
# On Mac/Linux:
source myenv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Run the app
streamlit run app.py
```

The app will open at `http://localhost:8501`

Upload a leaf image to get the predicted disease and confidence score.

---

## 🔌 Flask API

### 🛠️ Endpoints

**POST** `/predict`

* Upload an image file
* Include your API key in headers (`Authorization: Bearer YOUR_API_KEY`)
* **Response Example**:

```json
{
  "disease": "Apple___Apple_scab",
  "confidence": 0.9927
}
```

**GET** `/health`

* Returns server status:

```json
{ "status": "OK" }
```

> ⚠️ You must set your own API key for secure access.

---

## 📱 Flutter Mobile App

* Located in the `farm-O-help App` directory
* No login required
* API key must be set manually

### 📲 Running the App

```bash
cd "farm-O-help App"
flutter pub get
flutter run
```

* Select or capture an image
* It sends the image to the Flask API
* Displays predicted disease and confidence



## 🤝 Contribution

Contributions are welcome!

* Fork the repo
* Create a feature branch
* Submit a pull request

Please ensure any PRs are well-documented and follow project conventions.

---

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 🔗 Links

* 🔗 [Dataset on Kaggle](https://www.kaggle.com/datasets/vipoooool/new-plant-diseases-dataset)
* 🔗 [GitHub Repo](https://github.com/vishalkumarojha/Farm-O-Help)
