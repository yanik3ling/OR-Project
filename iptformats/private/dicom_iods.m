function iods = dicom_iods
%DICOM_IODS  Repository of information object definitions.
%   IODS = DICOM_IODS returns a structure array containing various DICOM
%   information object definitions (IODS), which are used to create
%   Service-Object Pair (SOP) classes.  SOP instances comprise the high-
%   level description of the information stored in a DICOM file.
%
%   The IODS struct array contains the following fields:
%   - Name: An abbreviated name of the IOD
%   - UID: The unique identifier of the storage class for this IOD
%   - Def_fcn: The function containing the modules' definitions
%   - Prep_fcn: The function used to process the raw metadata needed for
%     these modules
%   - Modules: A cell array describing the modules needed for this IOD.
%
%   The Modules cell array contains the name of the modules, the type of
%   the module ('M' = mandatory, 'C' = conditional, 'U' = user optional),
%   and the condition constant indicating whether the module should be
%   built.
%
%   See also DICOM_CREATE_IOD, DICOM_MODULES.

%   Copyright 1993-2010 The MathWorks, Inc.

% The lexicon has changed since we named some of the modules.
% Here's a translation:
% * SpecimenIdentification --> "Clinical Trial Subject"


iods = [];

iods(end+1).Name = 'CRImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
        'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'CRSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'CRImage'	'M', {}
	'OverlayPlane'	'U', {}
	'Curve'	'U', {}
	'ModalityLUT'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'CTImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.3';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePlane'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {'HAS_BOLUS'}
	'CTImage'	'M', {}
	'OverlayPlane'	'U', {'HAS_OVERLAY'}
	'VOILUT'	'U', {'HAS_VOILUT'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MRImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.4';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.4';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePlane'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {'HAS_BOLUS'}
	'MRImage'	'M', {}
	'OverlayPlane'	'U', {'HAS_OVERLAY'}
	'VOILUT'	'U', {'HAS_VOILUT'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'NMImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.20';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'NMPETPatientOrientation'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'NMImagePixel'	'M', {}
	'MultiFrame'	'M', {}
	'NMMultiFrame'	'M', {}
	'NMImage'	'M', {}
	'NMIsotope'	'M', {}
	'NMDetector'	'M', {}
	'NMTomoAcquisition'	'C', {}
	'NMMultiGatedAcquisition'	'C', {}
	'NMPhase'	'C', {}
	'NMReconstruction'	'C', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'U', {}
	'Curve'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'NMImageRetired';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.5';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'NMSeriesRetired'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'NMEquipmentRetired'	'U', {}
	'GeneralImage'	'M', {}
	'ImagePlane'	'U', {}
	'ImagePixel'	'M', {}
	'Cine'	'C', {}
	'MultiFrame'	'C', {}
	'NMImageRetired'	'M', {}
	'NMSPECTAcquisitionImageRetired'	'C', {}
	'NMMultiGatedAcquisitionImageRetired'	'C', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'U', {}
	'Curve'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'USImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.6.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'USFrameOfReference'	'C', {}
	'Synchronization'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'PaletteColorLookupTable'	'C', {}
	'USRegionCalibration'	'U', {}
	'USImage'	'M', {}
	'OverlayPlane'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'USMultiFrameImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.3.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'USFrameOfReference'	'C', {}
	'Synchronization'	'C', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'M', {}
	'MultiFrame'	'M', {}
	'PaletteColorLookupTable'	'C', {}
	'USRegionCalibration'	'U', {}
	'USImage'	'M', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'USImageRetired';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.6';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'USFrameOfReference'	'C', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'USRegionCalibration'	'U', {}
	'USImage'	'M', {}
	'OverlayPlane'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'USMultiFrameImageRetired';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'USFrameOfReference'	'C', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'C', {}
	'MultiFrame'	'M', {}
	'USRegionCalibration'	'U', {}
	'USImage'	'M', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'SCImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.7';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.8.1';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'U', {}
	'SCImageEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'SCImage'	'M', {}
	'OverlayPlane'	'U', {}
	'ModalityLUT'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MultiframeSingleBitSCImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.7.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.8.2';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'U', {}
	'SCImageEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'Cine'	'C', {'NEEDS_SC_CINE'}
	'MultiFrame'	'M', {}
	'FramePointers'	'U', {}
	'SCImage'	'U', {}
	'SCMultiFrameImage'	'M', {}
	'SCMultiFrameVector'	'C', {'IS_MULTIFRAME'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MultiframeGrayscaleByteSCImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.7.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.8.3';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'U', {}
	'SCImageEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'Cine'	'C', {'NEEDS_SC_CINE'}
	'MultiFrame'	'M', {}
	'FramePointers'	'U', {}
	'SCImage'	'U', {}
	'SCMultiFrameImage'	'M', {}
	'SCMultiFrameVector'	'C', {'IS_MULTIFRAME'}
	'VOILUT'	'C', {'HAS_VOILUT'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MultiframeGrayscaleWordSCImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.7.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.8.4';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'U', {}
	'SCImageEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'Cine'	'C', {'NEEDS_SC_CINE'}
	'MultiFrame'	'M', {}
	'FramePointers'	'U', {}
	'SCImage'	'U', {}
	'SCMultiFrameImage'	'M', {}
	'SCMultiFrameVector'	'C', {'IS_MULTIFRAME'}
	'VOILUT'	'C', {'HAS_VOILUT'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MultiframeTrueColorSCImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.7.4';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = 'PS 3.3 Sec. A.8.5';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'U', {}
	'SCImageEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'Cine'	'C', {'NEEDS_SC_CINE'}
	'MultiFrame'	'M', {}
	'FramePointers'	'U', {}
	'SCImage'	'U', {}
	'SCMultiFrameImage'	'M', {}
	'SCMultiFrameVector'	'C', {'IS_MULTIFRAME'}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'StandaloneOverlay';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.8';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'OverlayIdentification'	'M', {}
	'OverlayPlane'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'StandaloneCurve';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'CurveIdentification'	'M', {}
	'Curve'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'StandaloneModalityLUT';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.10';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'ModalityLUT'	'M', {}
	'LUTIdentification'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'StandaloneVOILUT';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.11';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'VOILUT'	'M', {}
	'LUTIdentification'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'XAImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.12.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'C', {}
	'MultiFrame'	'C', {}
	'FramePointers'	'U', {}
	'Mask'	'C', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'XRayImage'	'M', {}
	'XRayAcquisition'	'M', {}
	'XRayCollimator'	'U', {}
	'XRayTable'	'C', {}
	'XAPositioner'	'M', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'C', {}
	'Curve'	'U', {}
	'ModalityLUT'	'C', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'XABiplaneImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.12.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'C', {}
	'MultiFrame'	'C', {}
	'FramePointers'	'U', {}
	'Mask'	'C', {}
	'DisplayShutter'	'U', {}
	'XRayAcquisition'	'M', {}
	'XRayCollimator'	'U', {}
	'XAPositioner'	'M', {}
	'VOILUT'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'XRayImage'	'M', {}
	'XRayTable'	'C', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'C', {}
	'BiplaneOverlay'	'C', {}
	'Curve'	'U', {}
	'ModalityLUT'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'XRFImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.12.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'C', {}
	'MultiFrame'	'C', {}
	'FramePointers'	'U', {}
	'Mask'	'C', {}
	'XRayImage'	'M', {}
	'XRayAcquisition'	'M', {}
	'XRayCollimator'	'U', {}
	'DisplayShutter'	'U', {}
	'Therapy'	'U', {}
	'Device'	'U', {}
	'XRayTable'	'C', {}
	'XRFPositioner'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'C', {}
	'Curve'	'U', {}
	'ModalityLUT'	'C', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'PETImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.128';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'PETSeries'	'M', {}
	'PETIsotope'	'M', {}
	'PETMultigatedAcquisition'	'C', {}
	'NMPETPatientOrientation'	'M', {}
	'FrameOfReference'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePlane'	'M', {}
	'ImagePixel'	'M', {}
	'PETImage'	'M', {}
	'OverlayPlane'	'U', {}
	'VOILUT'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'StandalonePETCurve';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.129';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'PETSeries'	'M', {}
	'PETIsotope'	'M', {}
	'PETMultigatedAcquisition'	'C', {}
	'GeneralEquipment'	'M', {}
	'CurveIdentification'	'M', {}
	'Curve'	'M', {}
	'PETCurve'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'C', {}
	'Cine'	'C', {}
	'MultiFrame'	'C', {}
	'RTImage'	'M', {}
	'ModalityLUT'	'U', {}
	'VOILUT'	'U', {}
	'Approval'	'U', {}
	'Curve'	'U', {}
	'Audio'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTDose';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'FrameOfReference'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'C', {}
	'ImagePlane'	'C', {}
	'ImagePixel'	'C', {}
	'MultiFrame'	'C', {}
	'OverlayPlane'	'U', {}
	'MultiFrameOverlay'	'U', {}
	'ModalityLUT'	'U', {}
	'RTDose'	'M', {}
	'RTDVH'	'U', {}
	'StructureSet'	'C', {}
	'ROIContour'	'C', {}
	'RTDoseROI'	'C', {}
	'Audio'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTStructureSet';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'StructureSet'	'M', {}
	'ROIContour'	'M', {}
	'RTROIObservations'	'M', {}
	'Approval'	'U', {}
	'Audio'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTPlan';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.5';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'RTGeneralPlan'	'M', {}
	'RTPrescription'	'U', {}
	'RTToleranceTables'	'U', {}
	'RTPatientSetup'	'U', {}
	'RTFractionScheme'	'U', {}
	'RTBeams'	'C', {}
	'RTBrachyApplicationSetups'	'C', {}
	'Approval'	'U', {}
	'Audio'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTBeamsTreatmentRecord';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.4';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'RTGeneralTreatmentRecord'	'M', {}
	'RTPatientSetup'	'U', {}
	'RTTreatmentMachineRecord'	'M', {}
	'MeasuredDoseReferenceRecord'	'U', {}
	'CalculatedDoseReferenceRecord'	'U', {}
	'RTBeamsSessionRecord'	'M', {}
	'RTTreatmentSummaryRecord'	'U', {}
	'Curve'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTBrachyTreatmentRecord';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.6';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'RTGeneralTreatmentRecord'	'M', {}
	'RTPatientSetup'	'U', {}
	'RTTreatmentMachineRecord'	'M', {}
	'MeasuredDoseReferenceRecord'	'U', {}
	'CalculatedDoseReferenceRecord'	'U', {}
	'RTBrachySessionRecord'	'M', {}
	'RTTreatmentSummaryRecord'	'U', {}
	'Curve'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'RTTreatmentSummaryRecord';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.481.7';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'RTSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'RTGeneralTreatmentRecord'	'M', {}
	'RTTreatmentSummaryRecord'	'U', {}
	'Curve'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'DXImageForProcessing';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.1.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'DXImageForPresentation';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MammographyImageForProcessing';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.2.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'MammographySeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'MammographyImage'	'M', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MammographyImageForPresentation';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'MammographySeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'MammographyImage'	'M', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'IntraoralImageForProcessing';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.3.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'IntraoralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'IntraoralImage'	'M', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'IntraoralImageForPresentation';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.1.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'DXSeries'	'M', {}
	'IntraoralSeries'	'M', {}
	'FrameOfReference'	'U', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'ContrastBolus'	'U', {}
	'DisplayShutter'	'U', {}
	'Device'	'U', {}
	'Therapy'	'U', {}
	'DXAnatomyImaged'	'M', {}
	'DXImage'	'M', {}
	'DXDetector'	'M', {}
	'XRayCollimator'	'U', {}
	'DXPositioning'	'U', {}
	'XRayTomoAcquisition'	'U', {}
	'XRayAcquisitionDose'	'U', {}
	'XRayGeneration'	'U', {}
	'XRayFiltration'	'U', {}
	'XRayGrid'	'U', {}
	'IntraoralImage'	'M', {}
	'OverlayPlane'	'C', {}
	'Curve'	'U', {}
	'VOILUT'	'C', {}
	'ImageHistogram'	'U', {}
	'AcquisitionContext'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'VLEndoscopicImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.77.1.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'VLEndoscopicSeriesDummy'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'AcquisitionContext'	'M', {}
	'VLImage'	'M', {}
	'OverlayPlane'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'VLMicroscopicImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.77.1.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'VLMicroscopicSeriesDummy'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'AcquisitionContext'	'M', {}
	'VLImage'	'M', {}
	'OverlayPlane'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'VLSlideCoordinatesMicroscopicImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.77.1.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'VLSlideCoordinatesMicroscopicSeriesDummy'	'M', {}
	'FrameOfReference'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'AcquisitionContext'	'M', {}
	'VLImage'	'M', {}
	'SlideCoordinates'	'M', {}
	'OverlayPlane'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'VLPhotographicImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.77.1.4';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'VLPhotographicSeriesDummy'	'M', {}
	'GeneralEquipment'	'M', {}
	'GeneralImage'	'M', {}
	'ImagePixel'	'M', {}
	'AcquisitionContext'	'M', {}
	'VLImage'	'M', {}
	'OverlayPlane'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'BasicVoice';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.4.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'U', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'U', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'TwelveLeadECG';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.1.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'U', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'GeneralECG';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.1.2';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'U', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'AmbulatoryECG';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.1.3';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'U', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'HemodynamicWaveform';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.2.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'C', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'CardiacElectrophysiologyWaveform';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.9.3.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'Synchronization'	'C', {}
	'GeneralEquipment'	'M', {}
	'WaveformIdentification'	'M', {}
	'Waveform'	'M', {}
	'AcquisitionContext'	'M', {}
	'WaveformAnnotation'	'C', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'BasicTextSR';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.88.11';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'SRDocumentSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'SRDocumentGeneral'	'M', {}
	'SRDocumentContent'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'EnhancedSR';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.88.22';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'SRDocumentSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'SRDocumentGeneral'	'M', {}
	'SRDocumentContent'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'ComprehensiveSR';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.88.33';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'SRDocumentSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'SRDocumentGeneral'	'M', {}
	'SRDocumentContent'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'MammographyCADSR';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.88.50';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'SRDocumentSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'SRDocumentGeneral'	'M', {}
	'SRDocumentContent'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'KeyObjectSelectionDocument';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.88.59';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'C', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'KeyObjectDocumentSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'KeyObjectDocument'	'M', {}
	'SRDocumentContent'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'GrayscaleSoftcopyPresentationState';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.11.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
	'GeneralSeries'	'M', {}
	'PresentationSeries'	'M', {}
	'GeneralEquipment'	'M', {}
	'PresentationState'	'M', {}
	'Mask'	'C', {}
	'DisplayShutter'	'C', {}
	'BitmapDisplayShutter'	'C', {}
	'OverlayPlane'	'C', {}
	'OverlayCurveActivation'	'C', {}
	'DisplayedArea'	'M', {}
	'GraphicAnnotation'	'C', {}
	'SpatialTransformation'	'C', {}
	'GraphicLayer'	'C', {}
	'ModalityLUT'	'C', {}
	'SoftcopyVOILUT'	'C', {}
	'SoftcopyPresentationLUT'	'M', {}
	'SOPCommon'	'M', {}
};

iods(end+1).Name = 'EnhancedMRImage';
iods(end).UID = '1.2.840.10008.5.1.4.1.1.4.1';
iods(end).Def_fcn = 'dicom_modules';
iods(end).Prep_fcn = 'dicom_prep_metadata';
iods(end).Spec_part = '';
iods(end).Modules = {
        'FileMetadata', 'C', {'HAS_FILEMETADATA'}
	'Patient'	'M', {}
	'ClinicalTrialSubject'	'U', {}
	'GeneralStudy'	'M', {}
	'PatientStudy'	'U', {'TRUE'}
        'ClinicalTrialStudy'    'U', {}
	'GeneralSeries'	'M', {}
        'ClinicalTrialSeries'   'U', {}
        'MRSeries'      'M', {}
	'FrameOfReference'	'M', {}
	'Synchronization'	'C', {'IS_TIME_SYNCHRONIZED'}
	'GeneralEquipment'	'M', {}
	'EnhancedGeneralEquipment'	'M', {}
	'ImagePixel'	'M', {}
	'EnhancedContrastBolus'	'C', {}
	'MultiFrameFunctionalGroups'	'M', {}
	'MultiFrameDimension'	'M', {}
	'CardiacSynchronization'	'C', {}
	'RespiratorySynchronization'	'C', {}
	'BulkMotionSynchronization'	'C', {}
	'SupplementalPaletteColorLUT'	'C', {}
	'AcquisitionContext'	'M', {}
        'Device'  'U',{}
        'Specimen'  'U', {}
	'EnhancedMRImage'	'M', {}
	'MRPulseSequence'	'C', {}
	'SOPCommon'	'M', {}
};
