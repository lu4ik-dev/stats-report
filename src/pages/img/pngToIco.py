from PIL import Image

def convert_png_to_ico(png_path, ico_path):
    png_image = Image.open(png_path)
    png_image.save(ico_path)

if __name__ == "__main__":
    png_path = "logo1.png"  
    ico_path = "favicon.ico" 
    convert_png_to_ico(png_path, ico_path)
