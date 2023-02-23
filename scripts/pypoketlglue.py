import requests
import boto3

# Criar uma instância do cliente do DynamoDB
dynamodb = boto3.client('dynamodb')

# Definir nome da tabela e nome das colunas
table_name = 'pokemons'
pk_name = 'pokemon'
sk_name = 'generation'

# Definir URLs da API PokeAPI
pokemon_url = 'https://pokeapi.co/api/v2/pokemon'
contest_url = 'https://pokeapi.co/api/v2/contest-type'
evolution_url = 'https://pokeapi.co/api/v2/evolution-chain'
items_url = 'https://pokeapi.co/api/v2/item'
locations_url = 'https://pokeapi.co/api/v2/location'

# Definir função para extrair dados da API e gravar no DynamoDB
def extract_and_load_data(url, pk_value):
    response = requests.get(url)
    data = response.json()

    for item in data['results']:
        pk = {'S': pk_value}
        sk = {'S': item['name']}
        attrs = {'pk': pk, 'sk': sk}

        # Gravar dados no DynamoDB
        dynamodb.put_item(TableName=table_name, Item=attrs)

# Extrair dados da API e gravar no DynamoDB
extract_and_load_data(pokemon_url, 'pokemon')
extract_and_load_data(contest_url, 'contest')
extract_and_load_data(evolution_url, 'evolution')
extract_and_load_data(items_url, 'items')
extract_and_load_data(locations_url, 'locations')
