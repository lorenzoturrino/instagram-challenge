feature 'Images' do

  context 'visiting the main page with no images added yet' do

    before :each do
      visit '/images'
    end

    scenario 'should show there are no images' do
      expect(page).to have_content 'No Images Yet'
    end

  end

  context 'visiting the main page with images present' do
    let!(:test_image) {Image.create(title: DEFAULT_TITLE)}

    before :each do
      visit '/images'
    end

    scenario 'show the image title' do
      expect(page).to have_content test_image.title
    end

  end

  context 'adding a new image' do

    before :each do
      visit '/images'
    end

    scenario 'should prompt to add a new image' do
      expect(page).to have_link 'Add new image'
    end

    scenario 'should let the user choose a title, then display the entry on the main page' do
      helper_add_image
      expect(current_path).to eq images_path
      expect(page).to have_content DEFAULT_TITLE
    end

  end

end
