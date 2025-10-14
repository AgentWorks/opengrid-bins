"""
Tests for opengrid-bins.scad
@Copyright Arthur Moore 2024 MIT License
"""

from pathlib import Path
import pytest

from openscad_runner import *

@pytest.fixture(scope="class")
def default_parameters(pytestconfig):
    parameter_file_path = pytestconfig.rootpath.joinpath("tests/opengrid-bins.json")
    parameter_file_data = ParameterFile.from_json(parameter_file_path.read_text())
    return parameter_file_data.parameterSets["Default"]

@pytest.fixture
def openscad_runner(pytestconfig, default_parameters) -> OpenScadRunner:
    scad_path = pytestconfig.rootpath.joinpath('opengrid-bins.scad')
    scad_runner = OpenScadRunner(scad_path)
    scad_runner.image_folder_base = pytestconfig.rootpath.joinpath('images/base_snap_options/')
    scad_runner.parameters = default_parameters.copy()
    scad_runner.camera_arguments = CameraArguments(Vec3(0,0,0), CameraRotations.AngledBottom, 150)
    return scad_runner

class TestBinHoles:
    """
    Test how a single base looks with holes cut out.

    Currently only makes sure code runs, and outputs pictures for manual verification.
    """

    @classmethod
    def setUpClass(cls):
        parameter_file_path = Path("opengrid-rebuilt-bins.json")
        parameter_file_data = ParameterFile.from_json(parameter_file_path.read_text())
        cls.default_parameters = parameter_file_data.parameterSets["Default"]

    def setUp(self, openscad_runner):
        openscad_runner = OpenScadRunner(Path('../src/core/opengrid-rebuilt-bins.scad'))
        openscad_runner.image_folder_base = Path('../images/base_snap_options/')
        openscad_runner.parameters = self.default_parameters.copy()
        openscad_runner.camera_arguments = CameraArguments(Vec3(0,0,0), CameraRotations.AngledBottom, 150)

    def test_no_holes(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = False
        openscad_runner.create_image([], Path('no_holes.png'))

    def test_only_corner_snaps(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = True
        vars["only_corners"] = True
        openscad_runner.create_image([], Path('only_corner_snaps.png'))

    def test_snap_cutouts(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = True
        openscad_runner.create_image([], Path('snap_cutouts.png'))

    def test_snap_cutouts_no_chamfer(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = True
        vars["chamfer_snaps"] = False
        openscad_runner.create_image([], Path('snap_cutouts_no_chamfer.png'))

    def test_snap_cutouts_plain(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = True
        vars["chamfer_snaps"] = False
        openscad_runner.create_image([], Path('snap_cutouts_plain.png'))

    def test_snap_cutouts_chamfered(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["snap_cutouts"] = True
        vars["chamfer_snaps"] = True
        openscad_runner.create_image([], Path('snap_cutouts_chamfered.png'))

    def test_snap_cutouts_2x2_no_chamfer(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["gridx"] = 2
        vars["gridy"] = 2
        vars["snap_cutouts"] = True
        vars["chamfer_snaps"] = False
        openscad_runner.create_image([], Path('snap_cutouts_2x2_no_chamfer.png'))

    def test_snap_cutouts_2x2_chamfered(self, openscad_runner):
        vars = openscad_runner.parameters
        vars["gridx"] = 2
        vars["gridy"] = 2
        vars["snap_cutouts"] = True
        vars["chamfer_snaps"] = True
        openscad_runner.create_image([], Path('snap_cutouts_2x2_chamfered.png'))
