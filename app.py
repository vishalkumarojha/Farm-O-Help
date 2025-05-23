# Importing Necessary Libraries
import streamlit as st
from PIL import Image
import io
import numpy as np
import tensorflow as tf
from utils import clean_image, get_prediction, make_results

# Loading the Model and saving to cache
@st.cache_resource
def load_model(path):
    # Xception Model
    xception_model = tf.keras.models.Sequential([
        tf.keras.applications.xception.Xception(include_top=False, weights='imagenet', input_shape=(512, 512, 3)),
        tf.keras.layers.GlobalAveragePooling2D(),
        tf.keras.layers.Dense(4, activation='softmax')
    ])

    # DenseNet Model
    densenet_model = tf.keras.models.Sequential([
        tf.keras.applications.densenet.DenseNet121(include_top=False, weights='imagenet', input_shape=(512, 512, 3)),
        tf.keras.layers.GlobalAveragePooling2D(),
        tf.keras.layers.Dense(4, activation='softmax')
    ])

    # Ensembling the Models
    inputs = tf.keras.Input(shape=(512, 512, 3))
    xception_output = xception_model(inputs)
    densenet_output = densenet_model(inputs)
    outputs = tf.keras.layers.average([densenet_output, xception_output])

    model = tf.keras.Model(inputs=inputs, outputs=outputs)

    # Loading the Weights of Model
    model.load_weights(path)

    return model

# Removing Streamlit Menu & Footer
hide_streamlit_style = """
<style>
    #MainMenu {visibility: hidden;}
    footer {visibility: hidden;}
</style>
"""
st.markdown(hide_streamlit_style, unsafe_allow_html=True)

# Loading the Model
model = load_model('model.h5')

# Title and Description
st.title('Plant Disease Detection')
st.write("Upload an image of a plant leaf to check if it's healthy or diseased.")

# File uploader
uploaded_file = st.file_uploader("Choose an image file", type=["png", "jpg", "jpeg"])

# If a file is uploaded, process it
if uploaded_file is not None:
    # Display progress
    progress = st.text("Processing Image...")
    my_bar = st.progress(0)

    # Read uploaded image
    image = Image.open(io.BytesIO(uploaded_file.read()))
    
    # Show image preview (Resized for display)
    st.image(np.array(Image.fromarray(np.array(image)).resize((700, 400), Image.LANCZOS)), width=None)
    my_bar.progress(40)

    # Clean the image
    image = clean_image(image)

    # Make predictions
    predictions, predictions_arr = get_prediction(model, image)
    my_bar.progress(70)

    # Generate results
    result = make_results(predictions, predictions_arr)

    # Finish progress
    my_bar.progress(100)
    progress.empty()
    my_bar.empty()

    # Display results
    st.write(f"The plant **{result['status']}** with a **{result['prediction']}** diagnosis.")
