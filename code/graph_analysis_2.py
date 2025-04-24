"""
Description: This script is designed to read a sample parquet file and generate a CSV file to be loaded into the Neo4J creating a sample graph for analysis and cypher queries.
"""
import pandas as pd 

df = pd.read_parquet('../data/graph_data.parquet')

print(df['feeder_name'].unique())

feeder_name = 'WNA2V04'
df = df[df['feeder_name'] == 'WNA2V04']
df = df[df['node_class'] != 'metadata']

node_df = df[['node_id', 'node_class']].drop_duplicates()
node_df.to_csv(f'../src/import/elect_dist/{feeder_name}_nodes.csv', index=False)

relation_df = df[['from_node','node_id']].dropna().drop_duplicates()
relation_df.columns = ['from_node', 'to_node']

relation_2_df = df[['node_id','to_node']].dropna().drop_duplicates()
relation_2_df.columns = ['from_node', 'to_node']

node_relation_df = pd.concat([relation_df, relation_2_df], axis = 0)
node_relation_df.to_csv(f'../src/import/elect_dist/{feeder_name}_node_relation.csv', index=False)

