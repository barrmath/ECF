def test_index_get_status_codeOK(client):
    response = client.get("/")
    assert response.status_code == 200
