"""empty message

Revision ID: 0b7e7caa6e6e
Revises: 
Create Date: 2022-08-31 21:48:16.536516

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0b7e7caa6e6e'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_foreign_key(None, 'courses', 'instructors', ['instructor_id'], ['id'])
    op.create_foreign_key(None, 'courses', 'textbooks', ['textbook_id'], ['id'])
    op.add_column('students', sa.Column('gpa', sa.Float(), nullable=False))
    op.add_column('students', sa.Column('residence_hall_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'students', 'residence_halls', ['residence_hall_id'], ['id'])
    op.create_foreign_key(None, 'students', 'advisors', ['advisor_id'], ['id'])
    op.drop_column('students', 'residence_HALL_id')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('students', sa.Column('residence_HALL_id', sa.INTEGER(), autoincrement=False, nullable=True))
    op.drop_constraint(None, 'students', type_='foreignkey')
    op.drop_constraint(None, 'students', type_='foreignkey')
    op.drop_column('students', 'residence_hall_id')
    op.drop_column('students', 'gpa')
    op.drop_constraint(None, 'courses', type_='foreignkey')
    op.drop_constraint(None, 'courses', type_='foreignkey')
    # ### end Alembic commands ###
